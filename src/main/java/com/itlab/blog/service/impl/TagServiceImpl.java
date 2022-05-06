package com.itlab.blog.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.entity.Tag;
import com.itlab.blog.mapper.TagMapper;
import com.itlab.blog.model.dto.TagAddDTO;
import com.itlab.blog.model.dto.TagChangeDTO;
import com.itlab.blog.model.dto.TagDTO;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.service.ITagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements ITagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    @CacheEvict(cacheNames = EntityNames.TAG, allEntries = true)
    public void saveTag(TagAddDTO dto) {
        Tag tag = new Tag(null, dto.getName(), dto.getWeight(), 0);
        if (tagMapper.insert(tag) != 1) {
            throw new BusinessException("标签添加失败");
        }
    }

    @Override
    @Cacheable(cacheNames = EntityNames.TAG + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Tag getTag(Integer id) {
        return tagMapper.selectById(id);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.TAG + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<Tag> getTagList(TagDTO dto) {
        Page<Tag> page = new Page<>(dto.getIndex(), dto.getPageSize());
        return tagMapper.selectPage(page, new QueryWrapper<Tag>()
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .orderByDesc("weight"));
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.TAG, allEntries = true)
    public void modifyTag(TagChangeDTO dto) {
        Tag tag = tagMapper.selectById(dto.getTagId());
        if (null == tag) {
            throw new BusinessException("标签id有问题");
        }
        tag.setName(dto.getName());
        tag.setWeight(dto.getWeight());
        if (tagMapper.updateById(tag) != 1) {
            throw new BusinessException("标签更新失败");
        }
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.TAG, allEntries = true)
    public void removeById(Integer tagId) {
        if (tagMapper.deleteById(tagId) != 1) {
            throw new BusinessException("标签删除失败");
        }
    }

}

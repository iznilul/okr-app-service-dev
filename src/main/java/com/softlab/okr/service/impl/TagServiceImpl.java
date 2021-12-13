package com.softlab.okr.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.mapper.TagMapper;
import com.softlab.okr.model.dto.TagAddDTO;
import com.softlab.okr.model.dto.TagChangeDTO;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
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
    public void saveTag(TagAddDTO dto) {
        Tag tag = new Tag(null, dto.getName(), dto.getWeight(), 0);
        if (tagMapper.insert(tag) != 1) {
            throw new BusinessException("标签添加失败");
        }
    }

    @Override
    public Tag getTag(Integer id) {
        return tagMapper.selectById(id);
    }

    @Override
    public Result getTagList(TagDTO dto) {
        Page<Tag> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Tag> tagPage = tagMapper.selectPage(page, new QueryWrapper<Tag>()
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .orderByDesc("weight"));
        return Result.success(tagPage.getRecords(), tagPage.getCurrent(), tagPage.getTotal());
    }

    @Override
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
    public void removeById(Integer tagId) {
        if (tagMapper.deleteById(tagId) != 1) {
            throw new BusinessException("标签删除失败");
        }
    }

}

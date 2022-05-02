package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.Category;
import com.softlab.okr.mapper.CategoryMapper;
import com.softlab.okr.model.dto.CategoryAddDTO;
import com.softlab.okr.model.dto.CategoryChangeDTO;
import com.softlab.okr.model.dto.CategoryDTO;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    @CacheEvict(cacheNames = EntityNames.CATEGORY, allEntries = true)
    public void saveCategory(CategoryAddDTO dto) {
        Category category = new Category(null, dto.getName(), dto.getWeight(), 0);
        if (categoryMapper.insert(category) != 1) {
            throw new BusinessException("分类添加失败");
        }
    }

    @Override
    @Cacheable(cacheNames = EntityNames.CATEGORY + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Category getCategory(Integer id) {
        return categoryMapper.selectById(id);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.CATEGORY + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<Category> getCategoryList(CategoryDTO dto) {
        Page<Category> page = new Page<>(dto.getIndex(), dto.getPageSize());
        return categoryMapper.selectPage(page, new QueryWrapper<Category>()
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .orderByDesc("weight"));
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.CATEGORY, allEntries = true)
    public void modifyCategory(CategoryChangeDTO dto) {
        Category category = categoryMapper.selectById(dto.getCategoryId());
        if (null == category) {
            throw new BusinessException("分类id有问题");
        }
        category.setName(dto.getName());
        category.setWeight(dto.getWeight());
        if (categoryMapper.updateById(category) != 1) {
            throw new BusinessException("分类更新失败");
        }
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.CATEGORY, allEntries = true)
    public void removeById(Integer categoryId) {
        if (categoryMapper.deleteById(categoryId) != 1) {
            throw new BusinessException("分类删除失败");
        }
    }
}

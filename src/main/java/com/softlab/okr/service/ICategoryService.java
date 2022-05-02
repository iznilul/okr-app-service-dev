package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Category;
import com.softlab.okr.model.dto.CategoryAddDTO;
import com.softlab.okr.model.dto.CategoryChangeDTO;
import com.softlab.okr.model.dto.CategoryDTO;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
public interface ICategoryService extends IService<Category> {

    Page<Category> getCategoryList(CategoryDTO dto);

    void saveCategory(CategoryAddDTO dto);

    Category getCategory(Integer id);

    void modifyCategory(CategoryChangeDTO dto);

    void removeById(Integer categoryId);
}

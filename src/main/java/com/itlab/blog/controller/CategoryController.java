package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.entity.Category;
import com.itlab.blog.model.dto.CategoryAddDTO;
import com.itlab.blog.model.dto.CategoryChangeDTO;
import com.itlab.blog.model.dto.CategoryDTO;
import com.itlab.blog.service.ICategoryService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@Validated
@RestController
@RequestMapping("/blog/category")
public class CategoryController {

    @Autowired
    private ICategoryService categoryService;

    @PostMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "增加分类")
    public Result addCategory(@RequestBody @Validated CategoryAddDTO dto) {
        categoryService.saveCategory(dto);
        return Result.success(dto);
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更新分类")
    public Result changeCategory(@RequestBody @Validated CategoryChangeDTO dto) {
        categoryService.modifyCategory(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除分类")
    public Result cancelCategory(@RequestParam("categoryId") @NotNull Integer categoryId) {
        categoryService.removeById(categoryId);
        return Result.success();
    }

    @PostMapping("queryList")
    @Auth(role = RoleConstants.USER, name = "获取分类列表")
    public Result queryList(@RequestBody @Validated CategoryDTO dto) {
        Page<Category> page = categoryService.getCategoryList(dto);
        return Result.success(page.getRecords(), page.getCurrent(), page.getTotal());
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取分类")
    public Result queryCategory(@NotNull(message = "id不能为空")
                                @RequestParam("param") Integer id) {
        Category category = categoryService.getCategory(id);
        return Result.success(category);
    }
}

package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.Category;
import com.softlab.okr.model.dto.CategoryAddDTO;
import com.softlab.okr.model.dto.CategoryChangeDTO;
import com.softlab.okr.model.dto.CategoryDTO;
import com.softlab.okr.service.ICategoryService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@Validated
@RestController
@RequestMapping("/okr/category")
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

package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.entity.Tag;
import com.itlab.blog.model.dto.TagAddDTO;
import com.itlab.blog.model.dto.TagChangeDTO;
import com.itlab.blog.model.dto.TagDTO;
import com.itlab.blog.service.ITagService;
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
@RestController
@RequestMapping("/blog/tag")
public class TagController {

    @Autowired
    private ITagService tagService;

    @PostMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "增加标签")
    public Result addTag(@RequestBody @Validated TagAddDTO dto) {
        tagService.saveTag(dto);
        return Result.success(dto);
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更新标签")
    public Result changeTag(@RequestBody @Validated TagChangeDTO dto) {
        tagService.modifyTag(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除标签")
    public Result cancelTag(@RequestParam("tagId") @NotNull Integer tagId) {
        tagService.removeById(tagId);
        return Result.success();
    }

    @PostMapping("queryList")
    @Auth(role = RoleConstants.USER, name = "获取标签列表")
    public Result queryList(@RequestBody @Validated TagDTO dto) {
        Page<Tag> page = tagService.getTagList(dto);
        return Result.success(page.getRecords(), page.getCurrent(), page.getTotal());
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取标签")
    public Result queryTag(@NotNull(message = "id不能为空")
                           @RequestParam("param") Integer id) {
        Tag tag = tagService.getTag(id);
        return Result.success(tag);
    }
}

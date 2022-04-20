package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.TagAddDTO;
import com.softlab.okr.model.dto.TagChangeDTO;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.ITagService;
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
@RestController
@RequestMapping("/okr/tag")
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
        return tagService.getTagList(dto);
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取标签")
    public Result queryTag(@NotNull(message = "id不能为空")
                           @RequestParam("param") Integer id) {
        Tag tag = tagService.getTag(id);
        return Result.success(tag);
    }
}

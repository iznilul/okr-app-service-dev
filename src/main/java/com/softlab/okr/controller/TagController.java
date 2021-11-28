package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/tag")
@Api(tags = "管理员 标签接口")
public class TagController {

    @Autowired
    private ITagService tagService;

    @ApiOperation("增加标签")
    @GetMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "增加标签")
    public Result addTag(
            @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
            @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
        return tagService.saveTag(name, order) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("更新标签")
    @GetMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更新标签")
    public Result changeTag(
            @NotNull(message = "标签id不能为空") @RequestParam("tagId") int tagId,
            @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
            @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
        return tagService.modifyTag(tagId, name, order) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("删除标签")
    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除标签")
    public Result cancelTag(@RequestParam("tagId") @NotNull int tagId) {
        return tagService.removeById(tagId) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("获取标签列表")
    @PostMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取标签列表")
    public Result queryTag(@RequestBody @Validated TagDTO dto) {
        return tagService.getTagListByCond(dto);
    }
}

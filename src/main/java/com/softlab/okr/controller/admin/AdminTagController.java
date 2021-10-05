package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/admin/tag")
@Api(tags = "管理员 标签接口")
@Auth(id = 2400, name = "管理员 标签接口")
public class AdminTagController {

  @Autowired
  private ITagService tagService;


  @ApiOperation("增加标签")
  @GetMapping("add")
  @Auth(id = 1, name = "增加标签")
  public Result addTag(
      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
    return tagService.saveTag(name, order) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("更新标签")
  @GetMapping("change")
  @Auth(id = 2, name = "更新标签")
  public Result changeTag(
      @NotNull(message = "标签id不能为空") @RequestParam("tagId") int tagId,
      @NotBlank(message = "名称不能为空") @RequestParam("name") String name,
      @NotNull(message = "排序权重不能为空") @RequestParam("order") int order) {
    return tagService.modifyTag(tagId, name, order) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("删除标签")
  @GetMapping("cancel")
  @Auth(id = 3, name = "删除标签")
  public Result cancelTag(@RequestParam("tagId") @NotNull int tagId) {
    return tagService.removeById(tagId) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("获取标签列表")
  @PostMapping("query")
  @Auth(id = 4, name = "获取标签列表")
  public Result queryTag(@RequestBody @Validated TagDTO dto) {
    return tagService.getTagListByCond(dto);
  }
}

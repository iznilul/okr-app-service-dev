package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IRoleResourceService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/api/admin/resource")
@Api(tags = "管理员 资源接口")
@Auth(id = 2200, name = "管理员 资源接口")
public class AdminResourceController {

  @Autowired
  private IRoleResourceService roleResourceService;

  @Autowired
  private IResourceService resourceService;

  @ApiOperation("重载角色资源")
  @GetMapping("reload")
  @Auth(id = 1, name = "重载角色资源")
  public Result reloadRoleResource() {
    return roleResourceService.reloadRoleResource() ?
        Result.success() : Result.failure();
  }

  @ApiOperation("更改接口开放状态")
  @GetMapping("change")
  @Auth(id = 2, name = "更改接口开放状态")
  public Result changeResource(
      @NotNull(message = "resourceId不能为空") @RequestParam("resourceId") int resourceId) {
    return resourceService.modifyResourceStatus(resourceId) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("获取资源接口")
  @PostMapping("query")
  @Auth(id = 3, name = "获取资源接口")
  public Result queryResource(@RequestBody PageDTO dto) {
    return resourceService.getResourceList(dto);
  }
}

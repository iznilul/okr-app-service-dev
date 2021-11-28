package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/resource")
@Api(tags = "管理员 资源接口")
public class ResourceController {

    @Autowired
    private IResourceService resourceService;

    @ApiOperation("更改接口开放状态")
    @GetMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更改接口开放状态")
    public Result changeResource(
            @NotNull(message = "resourceId不能为空") @RequestParam("resourceId") int resourceId) {
        return resourceService.modifyResourceStatus(resourceId) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("获取资源接口")
    @PostMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取资源接口")
    public Result queryResource(@RequestBody PageDTO dto) {
        return resourceService.getResourceList(dto);
    }
}

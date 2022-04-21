package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/okr/resource")
public class ResourceController {

    @Autowired
    private IResourceService resourceService;

    @GetMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更改接口开放状态")
    public Result changeResource(
            @NotBlank(message = "resourceId不能为空") @RequestParam("resourceId") String resourceId) {
        resourceService.modifyResourceStatus(resourceId);
        return Result.success();
    }

    @PostMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取资源接口")
    public Result queryResource(@RequestBody ResourceDTO dto) {
        return resourceService.getResourceList(dto);
    }

    @GetMapping("queryName")
    @Auth(role = RoleConstants.ADMIN, name = "获取资源名称")
    public Result queryResourceName(@RequestParam(value = "param") String name) {
        List<String> list = resourceService.getResourceName(name);
        return Result.success(list);
    }
}

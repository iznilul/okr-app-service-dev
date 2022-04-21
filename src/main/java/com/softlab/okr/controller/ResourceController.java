package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.model.vo.ResourceVO;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

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
        Page<ResourceVO> page = resourceService.getResourceList(dto);
        return Result.success(page.getRecords(), page.getCurrent(), page.getTotal());
    }
}

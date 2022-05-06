package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.ResourceDTO;
import com.itlab.blog.model.vo.ResourceVO;
import com.itlab.blog.service.IResourceService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/blog/resource")
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

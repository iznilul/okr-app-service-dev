package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.GrantRoleDTO;
import com.itlab.blog.service.IUserRoleService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-25 01:51
 **/
@RestController
@RequestMapping("/blog/userRole")
public class UserRoleController {

    @Autowired
    private IUserRoleService userRoleService;

    @Auth(role = RoleConstants.SUPER_ADMIN, name = "修改成员的角色权限")
    @PostMapping("grant")
    public Result grantRole(@RequestBody GrantRoleDTO dto) {
        userRoleService.grantRole(dto);
        return Result.success();
    }

}

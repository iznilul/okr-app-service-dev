package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.GrantRoleDTO;
import com.softlab.okr.service.IUserRoleService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-25 01:51
 **/
@RestController
@RequestMapping("/okr/userRole")
public class UserRoleController {

    @Autowired
    private IUserRoleService userRoleService;

    @Auth(role = RoleConstants.SUPER_ADMIN, name = "修改成员的角色权限")
    @PostMapping("grant")
    public Result grantRole(@RequestBody GrantRoleDTO dto) {
        Boolean result = userRoleService.grantRole(dto);
        return result ? Result.success() : Result.failure();
    }

}

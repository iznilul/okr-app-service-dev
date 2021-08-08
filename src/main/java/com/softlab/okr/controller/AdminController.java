package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.exception.ControllerException;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.service.ResourceService;
import com.softlab.okr.service.RoleService;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.service.UserInfoService;
import com.softlab.okr.utils.MD5Util;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 角色
 *
 * @author RudeCrab
 */
@RestController
@RequestMapping("/api/admin")
@Api(tags = "管理员操作")
@Auth(id = 1000, name = "管理员操作")
public class AdminController {

    @Autowired
    private UserEntityService userEntityService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private UserInfoService userInfoService;

    private static final Map<String, String> map;

    static {
        map = new HashMap<String, String>();
        map.put("管理员", "admin");
        map.put("普通用户", "user");
    }

    @ApiOperation("注册用户")
    @PostMapping("register")
    @Auth(id = 1, name = "注册用户")
    public Result register(@RequestBody RegisterDTO registerDTO) {
        String password = MD5Util.string2MD5(registerDTO.getUsername());
        int roleId = roleService.getRoleId(registerDTO.getName());

        RoleResourceBo roleResourceBo = new RoleResourceBo(roleId,
                resourceService.getResourceIds(map.get(registerDTO.getName())));

        RegisterBo registerBo =
                new RegisterBo(
                        null,
                        registerDTO.getUsername(),
                        password);

        if (userEntityService.getByUsername(registerDTO.getUsername()) == null) {
            userEntityService.register(registerBo);
            roleService.addUserRole(registerBo.getUserId(), roleId);
            resourceService.addRoleResource(roleResourceBo);
            userInfoService.addUserInfo(registerBo.getUserId(), registerBo.getUsername(),
                    new Date().getTime(), new Date().getTime());
            return Result.success("注册成功");
        } else {
            throw new ControllerException(ResultCode.USER_HAS_EXISTED);
        }
    }

    @ApiOperation("删除用户")
    @GetMapping("removeByUsername")
    @Auth(id = 2, name = "删除用户")
    public Result removeByUsername(@RequestParam("username") String username)
            throws Exception {
        System.out.println(username);

        if (username.equals("")) {
            throw new ControllerException(ResultCode.PARAM_NOT_COMPLETE);
        }

        if (userEntityService.getByUsername(username) != null) {
            userEntityService.removeByUsername(username);
            return Result.success("删除成功");
        } else {
            throw new ControllerException(ResultCode.USER_LOGIN_ERROR);
        }
    }

    @ApiOperation("重载管理员资源")
    @GetMapping("reloadAdminRoleResource")
    @Auth(id = 3, name = "重载管理员资源")
    public Result reloadAdminRoleResource()
            throws Exception {
        RoleResourceBo roleResourceBo = new RoleResourceBo(1, resourceService.getResourceIds(
                "admin"));
        resourceService.reloadRoleResource(roleResourceBo);
        return Result.success("重载成功");
    }

    @ApiOperation("重载用户资源")
    @GetMapping("reloadUserRoleResource")
    @Auth(id = 4, name = "重载用户资源")
    public Result reloadUserRoleResource()
            throws Exception {
        RoleResourceBo roleResourceBo = new RoleResourceBo(2, resourceService.getResourceIds(
                "user"));
        resourceService.reloadRoleResource(roleResourceBo);
        return Result.success("重载成功");
    }

}

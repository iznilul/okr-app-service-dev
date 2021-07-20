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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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


}

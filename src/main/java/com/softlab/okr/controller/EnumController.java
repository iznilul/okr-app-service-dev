package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.enums.*;
import com.softlab.okr.service.IEnumService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-23 19:42
 **/
@RestController
@RequestMapping("/okr/enum")
public class EnumController {

    private static Map<String, List<String>> DICT_MAP = new HashMap<>();

    static {
        DICT_MAP.put("keyStatus", KeyEnum.getList());
        DICT_MAP.put("roleStatus", RoleEnum.getList());
        DICT_MAP.put("userStatus", UserStatusEnum.getList());
        DICT_MAP.put("signUpStatus", SignUpEnum.getList());
        DICT_MAP.put("bookStatus", BookEnum.getList());
    }

    @Autowired
    private IEnumService enumService;

    @GetMapping("key")
    @Auth(role = RoleConstants.USER, name = "模糊查询钥匙")
    public Result enumKey() {
        List<String> list = DICT_MAP.get("keyStatus");
        return Result.success(list);
    }

    @GetMapping("username")
    @Auth(role = RoleConstants.USER, name = "模糊查询用户名列表")
    public Result enumUsername(@RequestParam(value = "param") String username) {
        List<String> list = enumService.getLikeUsername(username);
        return Result.success(list);
    }

    @GetMapping("name")
    @Auth(role = RoleConstants.USER, name = "模糊查询姓名列表")
    public Result enumName(@RequestParam(value = "param") String name) {
        List<String> list = enumService.getLikeName(name);
        return Result.success(list);
    }

    @GetMapping("major")
    @Auth(role = RoleConstants.USER, name = "模糊查询专业列表")
    public Result enumMajor(@RequestParam(value = "param") String major) {
        List<String> list = enumService.getLikeMajor(major);
        return Result.success(list);
    }

    @GetMapping("role")
    @Auth(role = RoleConstants.USER, name = "模糊查询角色")
    public Result enumRole() {
        List<String> list = DICT_MAP.get("roleStatus");
        return Result.success(list);
    }

    @GetMapping("userStatus")
    @Auth(role = RoleConstants.USER, name = "模糊查询成员状态")
    public Result enumUserStatus() {
        List<String> list = DICT_MAP.get("userStatus");
        return Result.success(list);
    }

    @GetMapping("signUpStatus")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询报名状态")
    public Result enumSignUpStatus() {
        List<String> list = DICT_MAP.get("signUpStatus");
        return Result.success(list);
    }

    @GetMapping("book")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询书籍状态")
    public Result enumBook() {
        List<String> list = DICT_MAP.get("bookStatus");
        return Result.success(list);
    }

    @GetMapping("tag")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询标签")
    public Result enumTag() {
        List<String> list = enumService.getLikeTag();
        return Result.success(list);
    }


}

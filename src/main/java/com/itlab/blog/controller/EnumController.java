package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.enums.*;
import com.itlab.blog.service.IEnumService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-23 19:42
 **/
@RestController
@RequestMapping("/blog/enum")
public class EnumController {

    private static Map<String, List<String>> DICT_MAP = new HashMap<>();

    static {
        DICT_MAP.put("keyStatus", KeyEnum.getList());
        DICT_MAP.put("roleStatus", RoleEnum.getList());
        DICT_MAP.put("userStatus", UserStatusEnum.getList());
        DICT_MAP.put("signUpStatus", SignUpEnum.getList());
        DICT_MAP.put("bookStatus", BookEnum.getList());
        DICT_MAP.put("blogStatus", BlogStatusEnum.getList());
        DICT_MAP.put("publishIsOrNot", PublishIsOrNotEnum.getList());
        DICT_MAP.put("originalIsOrNot", OriginalIsOrNotEnum.getList());
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

    @GetMapping("blog")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询博客状态")
    public Result enumBlog() {
        List<String> list = DICT_MAP.get("blogStatus");
        return Result.success(list);
    }

    @GetMapping("publish")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询博客发布状态")
    public Result enumPublish() {
        List<String> list = DICT_MAP.get("publishIsOrNot");
        return Result.success(list);
    }

    @GetMapping("original")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询博客原创状态")
    public Result enumOriginal() {
        List<String> list = DICT_MAP.get("originalIsOrNot");
        return Result.success(list);
    }

    @GetMapping("tag")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询标签")
    public Result enumTag() {
        List<String> list = enumService.getLikeTag();
        return Result.success(list);
    }

    @GetMapping("category")
    @Auth(role = RoleConstants.ADMIN, name = "模糊查询分类")
    public Result enumCategory() {
        List<String> list = enumService.getLikeCategory();
        return Result.success(list);
    }
}

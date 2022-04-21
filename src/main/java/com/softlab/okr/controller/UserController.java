package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.*;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.model.vo.UserRoleVO;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.util.Base64;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/okr/user")
public class UserController {

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IUserEntityService userEntityService;

    @PostMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "注册用户")
    public Result addUser(@Validated @RequestBody RegisterDTO dto) {
        userEntityService.register(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除用户")
    public Result cancelUser(
            @NotBlank(message = "username不能为空") @RequestParam("username") String username) {

        return userEntityService.removeByUsername(username) ?
                Result.success() : Result.failure();
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.USER, name = "更新用户信息")
    public Result changeUser(@RequestBody UpdateUserDTO dto) {
        userInfoService.modifyUserInfo(dto);
        return Result.success();
    }

    @PostMapping("changeRole")
    @Auth(role = RoleConstants.USER, name = "更新用户权限")
    public Result changeUserRole(@RequestBody UpdateUserRoleDTO dto) {
        userInfoService.modifyUserRole(dto);
        return Result.success();
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.USER, name = "获取用户信息")
    public Result queryUser() {

        UserInfo userInfo = userInfoService.getUserInfo();
        return userInfo != null ? Result.success(userInfo) : Result.failure();
    }

    @GetMapping("queryRole")
    @Auth(role = RoleConstants.USER, name = "获取用户权限信息")
    public Result queryUserRole(@RequestParam("username") String username) {
        UserRoleVO vo = userInfoService.getUserRole(username);
        return vo != null ? Result.success(vo) : Result.failure();
    }

    @PostMapping("queryList")
    @Auth(role = RoleConstants.USER, name = "查询用户列表")
    public Result queryUserList(
            @RequestBody SelectUserDTO dto) throws Exception {

        return userInfoService.getUserInfoByCond(dto);
    }

    @PostMapping("changeImg")
    @Auth(role = RoleConstants.USER, name = "上传头像文件")
    public Result changeUserImg(
            @RequestParam("file") MultipartFile file)
            throws IOException {
        return userInfoService.uploadAvatar(file) == 1 ?
                Result.success("data:image/png;base64," + Base64.getEncoder().encodeToString(file.getBytes()))
                : Result.failure();
    }

    @PostMapping("changePassword")
    @Auth(role = RoleConstants.USER, name = "修改密码")
    public Result changePassword(@RequestBody ModifyPwdDTO dto) {
        return userEntityService.modifyPassword(dto) ?
                Result.success() : Result.failure();
    }

    @GetMapping("queryByUsername")
    @Auth(role = RoleConstants.USER, name = "根据用户名选择用户")
    public Result queryUserByUsername(@RequestParam("username") String username) {

        UserInfoVO vo = userInfoService.getUserInfoByUsername(username);
        return vo != null ? Result.success(vo) : Result.failure();
    }
}

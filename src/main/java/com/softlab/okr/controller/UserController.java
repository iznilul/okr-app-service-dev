package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.ModifyPwdDTO;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@RequestMapping("/api/okr/user")
@Api(tags = "管理员 用户接口")
public class UserController {

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IUserEntityService userEntityService;

    @ApiOperation("注册用户")
    @PostMapping("add")
    @Auth(resourceId = 121, role = RoleConstants.ADMIN, name = "注册用户")
    public Result addUser(@Validated @RequestBody RegisterDTO dto) {

        return userEntityService.register(dto) ? Result.success() : Result.failure();
    }

    @ApiOperation("删除用户")
    @GetMapping("cancel")
    @Auth(resourceId = 122, role = RoleConstants.ADMIN, name = "删除用户")
    public Result cancelUser(
            @NotBlank(message = "username不能为空") @RequestParam("username") String username) {

        return userEntityService.removeByUsername(username) ?
                Result.success() : Result.failure();
    }

    @ApiOperation("更新用户信息")
    @PostMapping("change")
    @Auth(resourceId = 123, role = RoleConstants.USER, name = "更新用户信息")
    public Result changeUser(@RequestBody UpdateUserDTO dto) {

        return userInfoService.modifyUserInfo(dto) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("获取用户信息")
    @GetMapping("query")
    @Auth(resourceId = 124, role = RoleConstants.USER, name = "根据账号选择用户")
    public Result queryUser() {

        UserInfo userInfo = userInfoService.getUserInfo();
        return userInfo != null ? Result.success(userInfo) : Result.failure();
    }

    @ApiOperation("根据条件选择用户")
    @PostMapping("queryList")
    @Auth(resourceId = 125, role = RoleConstants.USER, name = "根据情况选择用户")
    public Result queryUserList(
            @RequestBody SelectUserDTO dto) throws Exception {

        return userInfoService.getUserInfoByCond(dto);
    }

    @ApiOperation("上传头像文件")

    @PostMapping("changeImg")
    @Auth(resourceId = 126, role = RoleConstants.USER, name = "上传头像文件")
    public Result changeUserImg(
            @RequestParam("file") MultipartFile file)
            throws IOException {
        return userInfoService.uploadAvatar(file) == 1 ?
                Result
                        .success("data:image/png;base64," + Base64.getEncoder().encodeToString(file.getBytes()))
                : Result.failure();
    }

    @ApiOperation("修改密码")
    @PostMapping("changePassword")
    @Auth(resourceId = 127, role = RoleConstants.USER, name = "修改密码")
    public Result changePassword(@RequestBody ModifyPwdDTO dto) {
        return userEntityService.modifyPassword(dto) ?
                Result.success() : Result.failure();
    }

    @ApiOperation("根据用户名获取用户信息")
    @GetMapping("queryByUsername")
    @Auth(resourceId = 128, role = RoleConstants.USER, name = "根据用户名选择用户")
    public Result queryUserByUsername(@RequestParam("username") String username) {

        UserInfoVO vo = userInfoService.getUserInfoByUsername(username);
        return vo != null ? Result.success(vo) : Result.failure();
    }
}

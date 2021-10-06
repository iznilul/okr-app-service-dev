package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.ModifyPwdDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.io.IOException;
import java.util.Base64;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

@Slf4j
@RestController
@RequestMapping("/api/user/user")
@Api(tags = "用户 用户接口")
@Auth(id = 3100, name = "用户 用户接口")
public class UserUserController {

  @Autowired
  private IUserInfoService userInfoService;

  @Autowired
  private IUserEntityService userEntityService;

  /**
   * @Description: 用户信息更新 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("更新用户信息")
  @PostMapping("change")
  @Auth(id = 1, name = "更新用户信息")
  public Result changeUser(@RequestBody UpdateUserDTO dto) {

    return userInfoService.modifyUserInfo(dto) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("获取用户信息")
  @GetMapping("query")
  @Auth(id = 2, name = "根据账号选择用户")
  public Result queryUser() {

    UserInfo userInfo = userInfoService.getUserInfo();
    return userInfo != null ? Result.success(userInfo) : Result.failure();
  }

  @ApiOperation("根据条件选择用户")
  @PostMapping("queryList")
  @Auth(id = 3, name = "根据情况选择用户")
  public Result queryUserList(
      @RequestBody SelectUserDTO dto) throws Exception {

    return userInfoService.getUserInfoByCond(dto);
  }

  @ApiOperation("上传头像文件")

  @PostMapping("changeImg")
  @Auth(id = 4, name = "上传头像文件")
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
  @Auth(id = 5, name = "修改密码")
  public Result changePassword(@RequestBody ModifyPwdDTO dto) {
    return userEntityService.modifyPassword(dto) ?
        Result.success() : Result.failure();
  }

  @ApiOperation("根据用户名获取用户信息")
  @GetMapping("queryByUsername")
  @Auth(id = 6, name = "根据用户名选择用户")
  public Result queryUserByUsername(@RequestParam("username") String username) {

    UserInfo userInfo = userInfoService.getUserInfoByUsername(username);
    return userInfo != null ? Result.success(userInfo) : Result.failure();
  }

}

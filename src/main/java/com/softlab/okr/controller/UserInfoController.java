package com.softlab.okr.controller;

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
@RequestMapping("/api/user/info")
@Api(tags = "用户操作")
@Auth(id = 3000, name = "用户操作")
public class UserInfoController {

  @Autowired
  private IUserInfoService userInfoService;

  @Autowired
  private IUserEntityService userEntityService;

  /**
   * @Description: 用户信息更新 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("更新用户信息")
  @PostMapping("modifyUserInfo")
  @Auth(id = 1, name = "更新用户信息")
  public Result modifyUserInfo(@RequestBody UpdateUserDTO dto) {

    return userInfoService.modifyUserInfo(dto) == 1 ?
        Result.success() : Result.failure();
  }

  /**
   * @Description: 返回用户信息 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("根据账号选择用户")
  @GetMapping("userInfoByUsername")
  @Auth(id = 2, name = "根据账号选择用户")
  public Result userInfoByUsername(
      @RequestParam(value = "username", required = true) String username) {

    UserInfo userInfo = userInfoService.getUserInfo(username);
    return userInfo != null ? Result.success(userInfo) : Result.failure();
  }

  /**
   * @Description: 根据条件获取用户 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("根据条件选择用户")
  @PostMapping("userInfoByCond")
  @Auth(id = 3, name = "根据情况选择用户")
  public Result userInfoByCond(
      @RequestBody SelectUserDTO dto) throws Exception {

    return userInfoService.getUserInfoByCond(dto);
  }

  /**
   * @Description: 用户上传头像 @Param: [file,username,req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/4
   */
  @ApiOperation("上传头像文件")
  @PostMapping("upload")
  @Auth(id = 4, name = "上传头像文件")
  public Result upload(
      @RequestParam("username") String username, @RequestParam("file") MultipartFile file)
      throws IOException {
    return userInfoService.uploadAvatar(username, file) == 1 ?
        Result.success() : Result.failure();
  }

  /**
   * @Description: 修改密码 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/5
   */
  @ApiOperation("修改密码")
  @PostMapping("modifyPassword")
  @Auth(id = 5, name = "修改密码")
  public Result modifyPassword(@RequestBody ModifyPwdDTO dto) {
    return userEntityService.modifyPassword(dto) ?
        Result.success() : Result.failure();
  }

}

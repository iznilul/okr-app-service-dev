package com.softlab.okr.controller;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.exception.ApiException;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.ModifyPwdDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserInfo;
import com.softlab.okr.service.UserInfoService;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Base64;
import java.util.Date;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

@Slf4j
@RestController
@RequestMapping("/api/user")
@Api(tags = "用户操作")
@Auth(id = 2000, name = "用户操作")
public class UserInfoController {

  @Autowired
  UserInfoService userInfoService;


  /**
   * @Description: 用户信息更新 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("更新用户信息")
  @PostMapping("modifyUserInfo")
  @Auth(id = 1, name = "更新用户信息")
  public Result modifyUserInfo(@RequestBody UpdateUserDTO updateUserDto)
      throws Exception {
    System.out.println(updateUserDto);

    if (updateUserDto.getUsername().equals("")) {
        throw new ApiException(ResultCode.PARAM_NOT_COMPLETE);
    }

    if (userInfoService.modifyUserInfo(updateUserDto, new Date().getTime()) == 1) {
      return Result.success("用户信息更新成功");
    } else {
        throw new ApiException(ResultCode.USER_UPDATE_ERROR);
    }
  }

  /**
   * @Description: 返回用户信息 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("根据账号选择用户")
  @ApiImplicitParams(
      @ApiImplicitParam(
          name = "username",
          value = "用户账号",
          dataType = "String",
          required = true,
          defaultValue = "123"))
  @GetMapping("userInfoByUsername")
  @Auth(id = 2, name = "根据账号选择用户")
  public Result userInfoByUsername(
      @RequestParam(value = "username", required = true) String username) {
    System.out.println(username);

    if (username.equals("")) {
        throw new ApiException(ResultCode.PARAM_NOT_COMPLETE);
    }

    UserInfo userInfo = userInfoService.getUserInfoByUsername(username);
    if (userInfo != null) {
      return Result.success(userInfo);
    } else {
        throw new ApiException(ResultCode.USER_LOGIN_ERROR);
    }
  }

  /**
   * @Description: 根据条件获取用户 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
   */
  @ApiOperation("根据条件选择用户")
  @ApiImplicitParam(
      name = "pageNumber",
      value = "当前页数",
      dataType = "Integer",
      required = true,
      defaultValue = "1"
  )
  @PostMapping("userInfoByCond")
  @Auth(id = 3, name = "根据情况选择用户")
  public Result userInfoByCond(
      @RequestBody SelectUserDTO selectUserDto) throws Exception {

    int pageSize = selectUserDto.getPageSize();
    System.out.println(selectUserDto);
    PageInfo<UserInfo> userList = userInfoService.getUserInfoByCond(selectUserDto, pageSize);

    if (userList.getSize() > 0) {
      return Result.success(userList);
    } else {   //必须得这么写，不然分页查询有bug
      selectUserDto.setIndex(1);
      userList = userInfoService.getUserInfoByCond(selectUserDto, pageSize);
      if (userList.getSize() > 0) {
        return Result.success(userList);
      } else {
          throw new ApiException(ResultCode.UNKNOWN_ERROR);
      }
    }
  }

  /**
   * @Description: 用户上传头像 @Param: [file,username,req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/4
   */
  @ApiOperation("上传头像文件")
  @ApiImplicitParams({
      @ApiImplicitParam(
          name = "username",
          value = "用户账号",
          dataType = "String",
          required = true,
          defaultValue = "123"),
      @ApiImplicitParam(name = "file", value = "文件", dataType = "file", required = true)
  })
  @PostMapping("upload")
  @Auth(id = 4, name = "上传头像文件")
  public Result upload(
      @RequestParam("username") String username,
      @RequestParam("file") MultipartFile file)
      throws Exception {

    // 通过base64来转化图片
    byte[] data = file.getBytes();
    if (data.length > 1024000) {
        throw new ApiException(ResultCode.USER_UPLOAD_EXCEED);
    }

    // 将字节流转成字符串
    Base64.Encoder encoder = Base64.getEncoder();
    String avatar = "data:image/png;base64," + encoder.encodeToString(file.getBytes());

    if (userInfoService.uploadAvatar(username, avatar) == 1) {
      return Result.success(avatar);
    } else {
        throw new ApiException(ResultCode.USER_UPLOAD_ERROR);
    }
  }

  /**
   * @Description: 修改密码 @Param: [param, req]
   * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/5
   */
  @ApiOperation("修改密码")
  @PostMapping("modifyPassword")
  @Auth(id = 5, name = "修改密码")
  public Result modifyPassword(@RequestBody ModifyPwdDTO modifyPwdDto)
      throws Exception {
    System.out.println(modifyPwdDto);

    if (modifyPwdDto.getUsername().equals("")) {
        throw new ApiException(ResultCode.PARAM_NOT_COMPLETE);
    }

    LoginDTO loginDto = new LoginDTO(modifyPwdDto.getUsername(), modifyPwdDto.getOldPassword
        ());
    if (userInfoService.loginCheck(loginDto) != null) {
      if (userInfoService.modifyPassword(
          modifyPwdDto.getUsername(), modifyPwdDto.getNewPassword())
          == 1) {
        return Result.success("修改密码成功");
      } else {
          throw new ApiException(ResultCode.USER_UPDATE_ERROR);
      }
    } else {
        throw new ApiException(ResultCode.USER_LOGIN_ERROR);
    }
  }

}

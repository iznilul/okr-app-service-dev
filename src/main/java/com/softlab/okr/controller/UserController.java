package com.softlab.okr.controller;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

import com.github.pagehelper.PageInfo;
import com.softlab.okr.Exception.BusinessException;
import com.softlab.okr.bo.RegisterBo;
import com.softlab.okr.dto.user.*;
import com.softlab.okr.model.User;
import com.softlab.okr.service.UserService;
import com.softlab.okr.utils.MD5Util;
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

import javax.servlet.http.HttpServletRequest;
import java.util.Base64;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("user")
@Api(tags = "用户管理")
public class UserController {
    @Autowired
    UserService userService;

    /**
     * @Description: 登录 @Param: [param, req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/2
     */
    @ApiOperation("登录")
    @PostMapping("login")
    @ResponseBody
    public Result login(@RequestBody LoginDto loginDto, HttpServletRequest req) throws Exception {
        System.out.println(loginDto);

        // 缺失参数则抛出异常
        if (loginDto.getAccount().equals("") || loginDto.getPassword().equals("")) {
            throw new BusinessException(ResultCode.PARAM_NOT_COMPLETE);
        }

        // 取数据返回
        User user = userService.loginCheck(loginDto);
        if (user != null) {
            return Result.success(user);
        } else {
            throw new BusinessException(ResultCode.USER_LOGIN_ERROR);
        }
    }

    /**
     * @Description: 注册/添加用户 @Param: [param, req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/2
     */
    @ApiOperation("注册")
    @PostMapping("register")
    @ResponseBody
    public Result register(@RequestBody RegisterDto registerDto, HttpServletRequest req)
            throws Exception {
        System.out.println(registerDto);

        if (registerDto.getAccount().equals("") || registerDto.getRole().equals("")) {
            throw new BusinessException(ResultCode.PARAM_NOT_COMPLETE);
        }
        // 生成密码，封装业务类
        String password = MD5Util.string2MD5(registerDto.getAccount());
        RegisterBo registerBo =
                new RegisterBo(
                        registerDto.getRole(),
                        registerDto.getAccount(),
                        password,
                        new Date().getTime(),
                        new Date().getTime());

        if (userService.selectUser(registerDto.getAccount()) == null) {
            if (userService.register(registerBo) == 1) {
                return Result.success("注册成功");
            } else {
                throw new BusinessException(ResultCode.USER_REGISTER_ERROR);
            }
        } else {
            throw new BusinessException(ResultCode.USER_HAS_EXISTED);
        }
    }

    /**
     * @Description: 用户信息更新 @Param: [param, req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
     */
    @ApiOperation("更新用户信息")
    @PostMapping("updateUser")
    @ResponseBody
    public Result updateUser(@RequestBody UpdateUserDto updateUserDto, HttpServletRequest req)
            throws Exception {
        System.out.println(updateUserDto);

        if (updateUserDto.getAccount().equals("")) {
            throw new BusinessException(ResultCode.PARAM_NOT_COMPLETE);
        }

        if (userService.updateUser(updateUserDto, new Date().getTime()) == 1) {
            return Result.success("用户信息更新成功");
        } else {
            throw new BusinessException(ResultCode.USER_UPDATE_ERROR);
        }
    }

    /**
     * @Description: 返回用户信息 @Param: [param, req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/3
     */
    @ApiOperation("根据账号选择用户")
    @ApiImplicitParams(
            @ApiImplicitParam(
                    name = "account",
                    value = "用户账号",
                    dataType = "String",
                    required = true,
                    defaultValue = "123"))
    @GetMapping("selectUser")
    @ResponseBody
    public Result selectUser(
            @RequestParam(value = "account", required = true) String account,
            HttpServletRequest req) {
        System.out.println(account);

        if (account.equals("")) {
            throw new BusinessException(ResultCode.PARAM_NOT_COMPLETE);
        }

        User user = userService.selectUser(account);
        if (user != null) {
            return Result.success(user);
        } else {
            throw new BusinessException(ResultCode.USER_NOT_EXIST);
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
    @PostMapping("selectByCond")
    @ResponseBody
    public Result selectByCond(
            @RequestBody SelectUserDto selectUserDto,
            @RequestParam(value = "pageSize", defaultValue = "5", required = false) int pageSize,
            HttpServletRequest req) {

        System.out.println(selectUserDto);
        PageInfo<User> userList = userService.selectByCond(selectUserDto, pageSize);

        if (userList.getSize() > 0) {
            return Result.success(userList);
        } else {   //必须得这么写，不然分页查询有bug
            selectUserDto.setIndex(1);
            userList = userService.selectByCond(selectUserDto, pageSize);
            if (userList.getSize() > 0) {
                return Result.success(userList);
            } else {
                throw new BusinessException(ResultCode.RESULT_DATA_NONE);
            }
        }
    }

    /**
     * @Description: 用户上传头像 @Param: [file,account,req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/4
     */
    @ApiOperation("用户上传头像文件")
    @ApiImplicitParams({
            @ApiImplicitParam(
                    name = "account",
                    value = "用户账号",
                    dataType = "String",
                    required = true,
                    defaultValue = "123"),
            @ApiImplicitParam(name = "file", value = "文件", dataType = "file", required = true)
    })
    @PostMapping("upload")
    @ResponseBody
    public Result upload(
            @RequestParam("account") String account,
            @RequestParam("file") MultipartFile file,
            HttpServletRequest req)
            throws Exception {

        // 通过base64来转化图片
        byte[] data = file.getBytes();
        if (data.length > 1024000) {
            throw new BusinessException(ResultCode.USER_UPLOAD_EXCEED);
        }

        // 将字节流转成字符串
        Base64.Encoder encoder = Base64.getEncoder();
        String avatar = "data:image/png;base64," + encoder.encodeToString(file.getBytes());

        if (userService.uploadAvatar(account, avatar) == 1) {
            return Result.success(avatar);
        } else {
            throw new BusinessException(ResultCode.USER_UPLOAD_ERROR);
        }
    }

    /**
     * @Description: 修改密码 @Param: [param, req]
     * @return: com.softlab.okr.utils.Result @Author: radCircle @Date: 2021/7/5
     */
    @ApiOperation("用户更新密码")
    @PostMapping("verifyPassword")
    @ResponseBody
    public Result verifyPassword(@RequestBody VerifyPwdDto verifyPwdDto, HttpServletRequest req)
            throws Exception {
        System.out.println(verifyPwdDto);

        if (verifyPwdDto.getAccount().equals("")) {
            throw new BusinessException(ResultCode.PARAM_NOT_COMPLETE);
        }

        LoginDto loginDto = new LoginDto(verifyPwdDto.getAccount(), verifyPwdDto.getOldPassword());
        if (userService.loginCheck(loginDto) != null) {
            if (userService.verifyPassword(
                    verifyPwdDto.getAccount(), verifyPwdDto.getNewPassword(), new Date().getTime())
                    == 1) {
                return Result.success("修改密码成功");
            } else {
                throw new BusinessException(ResultCode.USER_UPDATE_ERROR);
            }
        } else {
            throw new BusinessException(ResultCode.USER_LOGIN_ERROR);
        }
    }
}

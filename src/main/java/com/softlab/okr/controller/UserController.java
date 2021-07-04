package com.softlab.okr.controller;

/**
 * @Author: Devhui
 * @Date: 2019-11-28 17:05
 * @Version 1.0
 */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.softlab.okr.model.User;
import com.softlab.okr.service.UserService;
import com.softlab.okr.utils.MD5Util;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    /**
     * @Description: 登录
     * @Param: [param, req]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/2
     */
    @PostMapping("login")
    @ResponseBody
    public Result login(@RequestBody String param, HttpServletRequest req) {
        System.out.println(param);
        JSONObject json = JSON.parseObject(param);
        String account = (String) json.get("account");
        String password = MD5Util.string2MD5((String) json.get("password"));
        try {
            User user = userService.loginCheck(account, password);
            return user != null ? Result.success(user) : Result.failure(ResultCode.USER_LOGIN_ERROR);
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_ERROR);
        }

    }

    /**
     * @Description: 注册/添加用户
     * @Param: [param, req]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/2
     */
    @PostMapping("register")
    @ResponseBody
    public Result register(@RequestBody String param, HttpServletRequest req) {
        System.out.println(param);
        JSONObject json = JSON.parseObject(param);

        String account = (String) json.get("account");
        String password = MD5Util.string2MD5(account);
        Integer role = (Integer) json.get("role");

        long createTime = new Date().getTime();
        long updateTime = new Date().getTime();

        try {
            if (userService.selectUser(account) == null) {
                return userService.register(role, account, password, createTime, updateTime) == 1 ?
                        Result.success("注册成功") : Result.failure(ResultCode.USER_REGISTER_ERROR);
            } else {
                return Result.failure(ResultCode.USER_HAS_EXISTED);
            }
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_ERROR);
        }
    }

    /**
     * @Description: 用户信息更新
     * @Param: [param, req]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/3
     */
    @PostMapping("update")
    @ResponseBody
    public Result updateUser(@RequestBody String param, HttpServletRequest req) {
        System.out.println(param);
        JSONObject json = JSON.parseObject(param);
        String account = (String) json.get("account");
        String userName = (String) json.get("userName");
        String major = (String) json.get("major");
        String qq = (String) json.get("qq");
        String weixin = (String) json.get("weixin");
        String desc = (String) json.get("desc");
        String phone = (String) json.get("phone");

        long updateTime = new Date().getTime();

        try {
            return userService.updateUser(account, userName, major, qq, phone, weixin, desc, updateTime) == 1 ?
                    Result.success("用户信息更新成功") : Result.failure(ResultCode.USER_UPDATE_ERROR);
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_ERROR);
        }
    }

    /**
     * @Description: 返回用户信息
     * @Param: [param, req]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/3
     */
    @PostMapping("select")
    @ResponseBody
    public Result selectUser(@RequestBody String param, HttpServletRequest req) {
        System.out.println(param);
        JSONObject json = JSON.parseObject(param);
        String account = (String) json.get("account");

        try {
            User user = userService.selectUser(account);
            return user != null ? Result.success(user) : Result.failure(ResultCode.USER_NOT_EXIST);
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_ERROR);
        }
    }

    /**
     * @Description: 根据条件获取用户
     * @Param: [param, req]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/3
     */
    @PostMapping("selectByCond")
    @ResponseBody
    public Result selectByCond(@RequestBody String param, HttpServletRequest req) {
        System.out.println(param);
        JSONObject json = JSON.parseObject(param);
        Integer role = (Integer) json.get("role");
        String account = (String) json.get("account");
        String userName = (String) json.get("userName");
        String major = (String) json.get("major");

        User queryUser = new User();
        queryUser.setAccount(account);
        queryUser.setRole(role);
        queryUser.setUserName(userName);
        queryUser.setMajor(major);

        try {
            List<User> userList = userService.selectByCond(queryUser);
            return Result.success(userList);
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_ERROR);
        }
    }

    /**
     * @Description: 用户上传操作
     * @Param: [file]
     * @return: com.softlab.okr.utils.Result
     * @Author: radCircle
     * @Date: 2021/7/4
     */
    @PostMapping("/upload")
    @ResponseBody
    public Result upload(@RequestParam("file") MultipartFile file) throws Exception {
        //上传文件
        // String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        // byte[] data = file.getBytes();

        // cString suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        // byte[] data = file.getBytes();

        // 通过base64来转化图片
        byte[] data = file.getBytes();
        if (data.length > 1024000) {
            return Result.failure(ResultCode.USER_UPLOAD_EXCEED);
        }

        BASE64Encoder encoder = new BASE64Encoder();
        String avatar = encoder.encode(file.getBytes());

        try {
            return Result.success();
        } catch (Exception e) {
            log.error(String.valueOf(e));
            return Result.failure(ResultCode.USER_UPLOAD_ERROR);
        }
    }
}

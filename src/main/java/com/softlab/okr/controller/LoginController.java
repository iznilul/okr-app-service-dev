package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


/**
 * @author RudeCrab
 */
@Slf4j
@RestController
@Api(tags = "通用 登陆部分接口")
@RequestMapping("/api/okr")
public class LoginController {

    @Autowired
    private IUserEntityService userEntityService;

    @Autowired
    private IAuthenticationService authenticationService;

    //将登录后的用户信息包括token返回给前端页面
    @ApiOperation("登录")
    @PostMapping("login")
    @Auth(resourceId = 111, role = RoleConstants.COMMON, name = "用户登录")
    public Result login(@RequestBody LoginDTO dto) throws Exception {
        UserVO userVO = userEntityService.login(dto);
        return userVO != null ? Result.success(userVO) : Result.failure();
    }

    @ApiOperation("测试")
    @GetMapping("test")
    @Auth(resourceId = 112, role = RoleConstants.COMMON, name = "认证测试")
    public Result test() {
        log.info("---test---");
        Authentication authentication = authenticationService.getAuthentication();
        log.info(authentication.toString());
        //log.info(authentication.getName());
        UserDetail userDetail = authenticationService.getPrincipal();
        log.info(userDetail.toString());
        return Result.success("认证通过");
    }

    @ApiOperation("注销")
    @GetMapping("logout")
    @Auth(resourceId = 113, role = RoleConstants.COMMON, name = "用户退出")
    public Result logout() {
        SecurityContext context = SecurityContextHolder.getContext();
        //SecurityContextHolder.clearContext();
        log.info("用户注销: " + context.getAuthentication().getName());
        context.setAuthentication(null);
        return Result.success();
    }
}
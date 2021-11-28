package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.UserEntityVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


/**
 * @author RudeCrab
 */
@Slf4j
@RestController
@Api(tags = "通用 登陆部分接口")
@RequestMapping("/api/okr/common")
public class CommonController {

    @Autowired
    private IUserEntityService userEntityService;

    @Autowired
    private IAuthenticationService authenticationService;

    //将登录后的用户信息包括token返回给前端页面
    @ApiOperation("登录")
    @PostMapping("login")
    @Auth(role = RoleConstants.COMMON, name = "用户登录")
    public Result login(@RequestBody LoginDTO dto) throws Exception {
        UserEntityVO userEntityVO = userEntityService.login(dto);
        return userEntityVO != null ? Result.success(userEntityVO) : Result.failure();
    }

    @ApiOperation("测试")
    @GetMapping("test")
    @Auth(role = RoleConstants.COMMON, name = "认证测试")
    public Result test() {
        log.info("---test---");
        throw new BusinessException("hist");
//        Authentication authentication = authenticationService.getAuthentication();
//        log.info(authentication.toString());
//        UserDetail userDetail = authenticationService.getPrincipal();
//        log.info(userDetail.toString());
//        return Result.success("认证通过");
    }

    @ApiOperation("注销")
    @GetMapping("logout")
    @Auth(role = RoleConstants.COMMON, name = "用户退出")
    public Result logout() {
        SecurityContext context = SecurityContextHolder.getContext();
        //SecurityContextHolder.clearContext();
        log.info("用户注销: " + context.getAuthentication().getName());
        context.setAuthentication(null);
        return Result.success();
    }
}
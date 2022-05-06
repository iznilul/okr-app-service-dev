package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.annotation.DisableRepeatSubmit;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.LoginDTO;
import com.itlab.blog.model.vo.UserEntityVO;
import com.itlab.blog.security.IAuthenticationService;
import com.itlab.blog.security.UserDetail;
import com.itlab.blog.service.IUserEntityService;
import com.itlab.blog.utils.Result;
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
@DisableRepeatSubmit
@RequestMapping("/blog/common")
public class CommonController {

    @Autowired
    private IUserEntityService userEntityService;

    @Autowired
    private IAuthenticationService authenticationService;

    //将登录后的用户信息包括token返回给前端页面
    @PostMapping("login")
    @Auth(role = RoleConstants.COMMON, name = "用户登录")
    public Result login(@RequestBody LoginDTO dto) throws Exception {
        UserEntityVO userEntityVO = userEntityService.login(dto);
        return Result.success(userEntityVO);
    }

    @GetMapping("test")
    @Auth(role = RoleConstants.COMMON, name = "认证测试")
    public Result test() {
        log.info("---test---");
        Authentication authentication = authenticationService.getAuthentication();
        log.info(authentication.toString());
        UserDetail userDetail = authenticationService.getPrincipal();
        log.info(userDetail.toString());
        return Result.success("认证通过");
    }

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
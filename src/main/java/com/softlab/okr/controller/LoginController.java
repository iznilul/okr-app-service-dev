package com.softlab.okr.controller;

import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


/**
 * @author RudeCrab
 */
@Slf4j
@RestController
@RequestMapping("/api")
public class LoginController {
    @Autowired
    private UserEntityService userEntityService;

    @Autowired
    private AuthenticationManager authenticationManager;

    //将登录后的用户信息包括token返回给前端页面
    @PostMapping("/login")
    public Result login(@RequestBody LoginDTO loginDTO) {
        return Result.success(userEntityService.login(loginDTO));
    }

    @GetMapping("/test")
    public Result test() {
        log.info("---test---");
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        log.info(authentication.toString());
        return Result.success("认证通过");
    }

    @GetMapping("/logout")
    public String logout() {
        SecurityContextHolder.clearContext();
        return "退出成功";
    }
}
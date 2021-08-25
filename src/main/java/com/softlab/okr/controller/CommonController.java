package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.config.CommonConfig;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.service.SignUpService;
import com.softlab.okr.service.SwitchService;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author RudeCrab
 */
@Slf4j
@RestController
@Api(tags = "通用操作")
@RequestMapping("/api")
@Auth(id = 1000, name = "通用操作")
public class CommonController {

  @Autowired
  private UserEntityService userEntityService;

  @Autowired
  private SignUpService signUpService;

  @Autowired
  private SwitchService switchService;

  @Autowired
  CommonConfig commonConfig;

  //将登录后的用户信息包括token返回给前端页面
  @ApiOperation("登录")
  @PostMapping("login")
  @Auth(id = 1, name = "用户登录")
  public Result login(@RequestBody LoginDTO loginDTO) {
    return Result.success(userEntityService.login(loginDTO));
  }

  @ApiOperation("测试")
  @GetMapping("test")
  @Auth(id = 2, name = "认证测试")
  public Result test() {
    log.info("---test---");
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    log.info(authentication.toString());
    return Result.success("认证通过");
  }

  @ApiOperation("注销")
  @GetMapping("logout")
  @Auth(id = 3, name = "用户退出")
  public String logout() {
    SecurityContextHolder.clearContext();
    return "退出成功";
  }

  @ApiOperation("报名")
  @PostMapping("signUp")
  @Auth(id = 4, name = "纳新报名")
  public Result signUp(@RequestBody SignUp signUp) {
    if (switchService.getStatus("报名") != 1) {
      return Result.failure(ResultCode.SIGNUP_NOT_OPEN);
    }
    if (signUpService.saveSignUpList(signUp) != 0) {
      return Result.success("报名成功，请加入纳新群: " + commonConfig.getQqGroupNumber());
    } else {
      return Result.failure(ResultCode.SIGNUP_ERROR);
    }
  }

  @ApiOperation("查询报名")
  @GetMapping("querySignUp")
  @Auth(id = 5, name = "报名结果查询")
  public Result querySignUp(@RequestParam String id) {
    if (switchService.getStatus("查询报名") != 1) {
      return Result.failure(ResultCode.API_NOT_OPEN);
    }
    SignUp signUp = signUpService.getSignUpListById(id);
    if (signUp != null) {
      return Result.success(signUp);
    } else {
      return Result.failure(ResultCode.QUERY_ERROR);
    }
  }
}
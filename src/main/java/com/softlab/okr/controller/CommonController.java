package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.config.CommonConfig;
import com.softlab.okr.exception.ApiException;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.AuthenticationService;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.SignUpService;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
@RequestMapping("/api/common")
@Auth(id = 1000, name = "通用操作")
public class CommonController {

  @Autowired
  private UserEntityService userEntityService;

  @Autowired
  private SignUpService signUpService;

  @Autowired
  private CommonConfig commonConfig;

  @Autowired
  private AuthenticationService authenticationService;

  @Autowired
  private PasswordEncoder passwordEncoder;

  //将登录后的用户信息包括token返回给前端页面
  @ApiOperation("登录")
  @PostMapping("login")
  @Auth(id = 1, name = "用户登录")
  public Result login(@RequestBody LoginDTO loginDTO) {
    // 根据用户名查询出用户实体对象
    UserEntity user = userEntityService.getByUsername(loginDTO.getUsername());
    // 若没有查到用户或者密码校验失败则抛出异常，将未加密的密码和已加密的密码进行比对
    if (user == null || !passwordEncoder.matches(loginDTO.getPassword(), user.getPassword())) {
      throw new ApiException(ResultCode.USER_LOGIN_ERROR);
    }
    UserVO userVO = userEntityService.login(user);
    if (userVO != null) {
      return Result.success(userVO);
    } else {
      return Result.failure(ResultCode.USER_LOGIN_ERROR);
    }
  }

  @ApiOperation("测试")
  @GetMapping("test")
  @Auth(id = 2, name = "认证测试")
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
  @Auth(id = 3, name = "用户退出")
  public Result logout() {
    SecurityContext context = SecurityContextHolder.getContext();
    //SecurityContextHolder.clearContext();
    log.info("用户注销: " + context.getAuthentication().getName());
    context.setAuthentication(null);
    return Result.success();
  }

  @ApiOperation("报名")
  @PostMapping("signUp")
  @Auth(id = 4, name = "纳新报名")
  public Result signUp(@RequestBody SignUp signUp) {
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
    SignUpVO signUpVO = signUpService.getSignUpListById(id);
    if (signUpVO != null) {
      return Result.success(signUpVO);
    } else {
      return Result.failure(ResultCode.QUERY_ERROR);
    }
  }
}
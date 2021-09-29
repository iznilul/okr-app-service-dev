package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.config.CommonConfig;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.AuthenticationServiceImpl;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.ICsdnSpiderService;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
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
@RequestMapping("/api/common")
@Auth(id = 1000, name = "通用操作")
public class CommonController {

  @Autowired
  private IUserEntityService userEntityService;

  @Autowired
  private ISignUpService signUpService;

  @Autowired
  private CommonConfig commonConfig;

  @Autowired
  private AuthenticationServiceImpl authenticationService;

  @Autowired
  private ICsdnSpiderService csdnSpiderService;

  //将登录后的用户信息包括token返回给前端页面
  @ApiOperation("登录")
  @PostMapping("login")
  @Auth(id = 1, name = "用户登录")
  public Result login(@RequestBody LoginDTO dto) throws Exception {
    UserVO userVO = userEntityService.login(dto);
    return userVO != null ? Result.success(userVO) : Result.failure();
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
  public Result signUp(@RequestBody UserSignUpDTO dto) {
    //System.out.println(dto);

    return signUpService.saveSignUp(dto) == 1
        ? Result.success("报名成功，请加入纳新群: " + commonConfig.getQqGroupNumber())
        : Result.failure();
  }

  @ApiOperation("查询报名")
  @GetMapping("querySignUp")
  @Auth(id = 5, name = "报名结果查询")
  public Result querySignUp(@RequestParam String studentId) {
    SignUpVO signUpVO = signUpService.getSignUpById(studentId);
    return signUpVO != null ? Result.success(signUpVO) : Result.failure();
  }

  @ApiOperation("csdn实时展示")
  @GetMapping("csdnRecord")
  @Auth(id = 6, name = "csdn实时展示")
  public Result csdnRecord() {
    return csdnSpiderService.getAll();
  }
}
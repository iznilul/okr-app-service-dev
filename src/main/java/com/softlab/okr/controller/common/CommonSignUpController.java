package com.softlab.okr.controller.common;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.config.CommonConfig;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
@Api(tags = "通用 报名接口")
@RequestMapping("/api/common/signup")
@Auth(id = 1200, name = "通用 报名接口")
public class CommonSignUpController {

  @Autowired
  private ISignUpService signUpService;

  @Autowired
  private CommonConfig commonConfig;

  @ApiOperation("报名")
  @PostMapping("add")
  @Auth(id = 1, name = "纳新报名")
  public Result addSignUp(@RequestBody UserSignUpDTO dto) {
    //System.out.println(dto);

    return signUpService.saveSignUp(dto) == 1
        ? Result.success("报名成功，请加入纳新群: " + commonConfig.getQqGroupNumber())
        : Result.failure();
  }

  @ApiOperation("查询报名")
  @GetMapping("query")
  @Auth(id = 2, name = "报名结果查询")
  public Result querySignUp(@RequestParam String studentId) {
    SignUpVO signUpVO = signUpService.getSignUpById(studentId);
    return signUpVO != null ? Result.success(signUpVO) : Result.failure();
  }
}
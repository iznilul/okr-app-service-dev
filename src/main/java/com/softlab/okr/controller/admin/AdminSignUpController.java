package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/admin/signup")
@Api(tags = "管理员 报名接口")
@Auth(id = 2300, name = "管理员 报名接口")
public class AdminSignUpController {

  @Autowired
  private ISignUpService signUpService;

  @ApiOperation("获取报名记录")
  @PostMapping("query")
  @Auth(id = 1, name = "获取报名记录")
  public Result querySignUp(@RequestBody SignUpDTO dto) {
    return signUpService.getSignUpByCond(dto);
  }

  @ApiOperation("更新报名记录")
  @PostMapping("change")
  @Auth(id = 2, name = "更新报名记录")
  public Result changeSignUp(@RequestBody SignUp signUP) {

    return signUpService.modifySignUp(signUP) == 1 ?
        Result.success() : Result.failure();
  }

  @ApiOperation("导出报名单")
  @GetMapping("export")
  @Auth(id = 3, name = "导出报名单")
  public void exportSignUp(HttpServletResponse response) throws IOException {
    signUpService.exportSignUp(response);
  }
}

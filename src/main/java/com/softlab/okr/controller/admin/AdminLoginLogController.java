package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.service.ILoginLogService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
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
@RequestMapping("/api/admin/loginLog")
@Api(tags = "管理员 操作日志接口")
@Auth(id = 2700, name = "管理员 操作日志接口")
public class AdminLoginLogController {

  @Autowired
  private ILoginLogService loginLogService;


  @LimitedAccess(frequency = 2, second = 30)
  @PostMapping("query")
  @ApiOperation("登录日志列表")
  @Auth(id = 1, name = "登录日志列表")
  public Result queryLoginLogList(@RequestBody @Validated LoginLogDTO dto) {

    return loginLogService.getByCond(dto);
  }
}

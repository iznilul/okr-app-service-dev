package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/api/user/keyUser")
@Api(tags = "用户 钥匙记录接口")
@Auth(id = 3600, name = "用户 钥匙记录接口")
public class UserKeyUserController {

  @Autowired
  private IKeyUserService keyUserService;

  @GetMapping("query")
  @ApiOperation("钥匙记录列表")
  @Auth(id = 1, name = "钥匙记录列表")
  public Result queryKeyUser(@RequestBody PageDTO dto) {
    return keyUserService.getKeyUser(dto);
  }
}

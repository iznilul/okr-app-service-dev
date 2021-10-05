package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/api/user/key")
@Api(tags = "用户 钥匙接口")
@Auth(id = 3400, name = "用户 钥匙接口")
public class UserKeyController {

  @Autowired
  private IKeyService keyService;

  @GetMapping("query")
  @ApiOperation("钥匙列表")
  @Auth(id = 1, name = "钥匙列表")
  public Result queryKey(@RequestBody PageDTO dto) {
    return keyService.getKey(dto);
  }

  @GetMapping("borrow")
  @ApiOperation("借钥匙")
  @Auth(id = 2, name = "借钥匙")
  public Result borrowKey(@RequestParam("keyId") int keyId) {
    return keyService.borrowKey(keyId) == 1 ? Result.success() : Result.failure();
  }

  @GetMapping("return")
  @ApiOperation("还钥匙")
  @Auth(id = 3, name = "还钥匙")
  public Result returnKey(@RequestParam("keyId") int keyId) {
    return keyService.returnKey(keyId) == 1 ? Result.success() : Result.failure();
  }

}

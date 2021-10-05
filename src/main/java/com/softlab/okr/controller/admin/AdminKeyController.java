package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/admin/key")
@Api(tags = "管理员 钥匙接口")
@Auth(id = 2600, name = "管理员 钥匙接口")
public class AdminKeyController {

  @Autowired
  private IKeyService keyService;


  @GetMapping("add")
  @ApiOperation("增加钥匙")
  @Auth(id = 1, name = "增加钥匙")
  public Result addKey(@RequestParam("keyName") @NotBlank String keyName) {
    return keyService.saveKey(keyName) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("change")
  @ApiOperation("修改钥匙")
  @Auth(id = 2, name = "修改钥匙")
  public Result changeKey(@RequestBody KeyDTO dto) {
    return keyService.modifyKey(dto) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("cancel")
  @ApiOperation("删除钥匙")
  @Auth(id = 3, name = "删除钥匙")
  public Result cancelKey(@RequestParam("keyId") @NotNull int keyId) {
    return keyService.removeById(keyId) ?
        Result.success() : Result.failure();
  }
}

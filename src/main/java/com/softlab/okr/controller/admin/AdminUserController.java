package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
@RequestMapping("/api/admin/user")
@Api(tags = "管理员 用户接口")
@Auth(id = 2100, name = "管理员 用户接口")
public class AdminUserController {

  @Autowired
  private IUserEntityService userEntityService;

  @ApiOperation("注册用户")
  @PostMapping("add")
  @Auth(id = 1, name = "注册用户")
  public Result addUser(@Validated @RequestBody RegisterDTO dto) {

    return userEntityService.register(dto) ? Result.success() : Result.failure();
  }

  @ApiOperation("删除用户")
  @GetMapping("cancel")
  @Auth(id = 2, name = "删除用户")
  public Result cancelUser(
      @NotBlank(message = "username不能为空") @RequestParam("username") String username) {

    return userEntityService.removeByUsername(username) > 0 ?
        Result.success() : Result.failure();
  }
}

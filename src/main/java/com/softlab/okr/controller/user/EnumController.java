package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.service.IEnumService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-23 19:42
 **/
@RestController
@RequestMapping("/api/user/enum")
@Api(tags = "用户 公共枚举接口")
@Auth(id = 3300, name = "用户 公共枚举接口")
public class EnumController {

  @Autowired
  private IEnumService enumService;

  @GetMapping("username")
  @Auth(id = 1, name = "模糊查询用户名列表")
  public Result queryLikeUsername(@RequestParam(value = "username") String username) {
    List<String> list = enumService.getLikeUsername(username);
    return Result.success(list);
  }

  @GetMapping("name")
  @Auth(id = 2, name = "模糊查询姓名列表")
  public Result queryLikeName(@RequestParam(value = "name") String name) {
    List<String> list = enumService.getLikeName(name);
    return Result.success(list);
  }

  @GetMapping("major")
  @Auth(id = 3, name = "模糊查询专业列表")
  public Result queryLikeMajor(@RequestParam(value = "major") String major) {
    List<String> list = enumService.getLikeMajor(major);
    return Result.success(list);
  }
}

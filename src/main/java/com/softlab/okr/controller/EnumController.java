package com.softlab.okr.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.entity.Role;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.model.enums.BaseCode;
import com.softlab.okr.service.IRoleService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
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
@Api(tags = "公用枚举类级模糊查询接口")
@Auth(id = 9000, name = "公用枚举类接口")
public class EnumController {

  private static Map<String, BaseCode[]> DICT_MAP = new HashMap<>();

  @Autowired
  private IRoleService roleService;

  @Autowired
  private IUserEntityService userEntityService;

  @GetMapping("/status")
  @Auth(id = 1, name = "状态类枚举接口")
  public Result statusCode(@RequestParam(name = "code") String code) {
    return null;
  }

  @GetMapping("/role")
  @Auth(id = 6, name = "模糊查询角色列表")
  public Result getLikeRole(@RequestParam(value = "roleName") String roleName) {
    List<String> list = roleService.list(new QueryWrapper<Role>().like("name", roleName)).stream()
        .map(Role::getName).collect(
            Collectors.toList());
    return Result.success(list);
  }

  @GetMapping("/username")
  @Auth(id = 7, name = "模糊查询用户名列表")
  public Result getLikeUsername(@RequestParam(value = "username") String username) {
    List<String> list = userEntityService
        .list(new QueryWrapper<UserEntity>().like("username", username)).stream()
        .map(UserEntity::getUsername).collect(Collectors.toList());
    return Result.success(list);
  }

}

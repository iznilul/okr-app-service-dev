package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/keyUser")
@Api(tags = "管理员 钥匙记录接口")
public class KeyUserController {

    @Autowired
    private IKeyUserService keyUserService;

    @GetMapping("add")
    @ApiOperation("增加钥匙持有人")
    @Auth(role = RoleConstants.ADMIN, name = "增加钥匙持有人")
    public Result addKeyUser(@RequestParam("keyId") @NotNull int keyId,
                             @RequestParam("userId") @NotNull int userId) {
        return keyUserService.saveKeyUser(keyId, userId) == 1 ?
                Result.success() : Result.failure();
    }

    @GetMapping("cancel")
    @ApiOperation("删除钥匙持有人")
    @Auth(role = RoleConstants.ADMIN, name = "删除钥匙持有人")
    public Result cancelKeyUser(@RequestParam("id") @NotNull int id) {
        return keyUserService.removeByUserId(id) == 1 ?
                Result.success() : Result.failure();
    }

    @PostMapping("query")
    @ApiOperation("钥匙记录列表")
    @Auth(role = RoleConstants.USER, name = "钥匙记录列表")
    public Result queryKeyUser(@RequestBody PageDTO dto) {
        return keyUserService.getKeyUser(dto);
    }

}

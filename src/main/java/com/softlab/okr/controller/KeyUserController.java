package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyUserVO;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
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
@RequestMapping("/okr/keyUser")
public class KeyUserController {

    @Autowired
    private IKeyUserService keyUserService;

    @GetMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "增加钥匙持有人")
    public Result addKeyUser(@RequestParam("keyId") @NotNull int keyId,
                             @RequestParam("userId") @NotNull int userId) {
        keyUserService.saveKeyUser(keyId, userId);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除钥匙持有人")
    public Result cancelKeyUser(@RequestParam("id") @NotNull int id) {
        keyUserService.removeByUserId(id);
        return Result.success();
    }

    @PostMapping("query")
    @Auth(role = RoleConstants.USER, name = "钥匙记录列表")
    public Result queryKeyUser(@RequestBody PageDTO dto) {
        Page<KeyUserVO> voPage = keyUserService.getKeyUser(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

}

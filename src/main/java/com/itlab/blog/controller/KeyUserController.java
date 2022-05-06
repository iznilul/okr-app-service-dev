package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.KeyUserVO;
import com.itlab.blog.service.IKeyUserService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/blog/keyUser")
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

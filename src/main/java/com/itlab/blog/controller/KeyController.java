package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.KeyDTO;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.KeyVO;
import com.itlab.blog.service.IKeyService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/blog/key")
public class KeyController {

    @Autowired
    private IKeyService keyService;

    @GetMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "增加钥匙")
    public Result addKey(@RequestParam("keyName") @NotBlank String keyName) {
        keyService.saveKey(keyName);
        return Result.success();
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "修改钥匙")
    public Result changeKey(@RequestBody KeyDTO dto) {
        keyService.modifyKey(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除钥匙")
    public Result cancelKey(@RequestParam("keyId") @NotNull int keyId) {
        keyService.removeById(keyId);
        return Result.success();
    }

    @GetMapping("queryById")
    @Auth(role = RoleConstants.ADMIN, name = "根据id查询钥匙")
    public Result queryKeyById(@RequestParam("keyId") int keyId) {
        KeyVO vo = keyService.getKeyById(keyId);
        return null != vo ? Result.success(vo) : Result.failure();
    }

    @PostMapping("query")
    @Auth(role = RoleConstants.USER, name = "钥匙列表")
    public Result queryKey(@RequestBody PageDTO dto) {
        Page<KeyVO> voPage = keyService.getKey(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @GetMapping("borrow")
    @Auth(role = RoleConstants.USER, name = "借钥匙")
    public Result borrowKey(@RequestParam("keyId") int keyId) {
        keyService.borrowKey(keyId);
        

        return Result.success();
    }

    @GetMapping("return")
    @Auth(role = RoleConstants.USER, name = "还钥匙")
    public Result returnKey(@RequestParam("keyId") int keyId) {
        keyService.returnKey(keyId);
        return Result.success();
    }

}

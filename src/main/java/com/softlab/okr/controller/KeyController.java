package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/key")
@Api(tags = "管理员 钥匙接口")
public class KeyController {

    @Autowired
    private IKeyService keyService;

    @GetMapping("add")
    @ApiOperation("增加钥匙")
    @Auth(resourceId = 21, role = RoleConstants.ADMIN, name = "增加钥匙")
    public Result addKey(@RequestParam("keyName") @NotBlank String keyName) {
        return keyService.saveKey(keyName) == 1 ?
                Result.success() : Result.failure();
    }

    @PostMapping("change")
    @ApiOperation("修改钥匙")
    @Auth(resourceId = 22, role = RoleConstants.ADMIN, name = "修改钥匙")
    public Result changeKey(@RequestBody KeyDTO dto) {
        return keyService.modifyKey(dto) == 1 ?
                Result.success() : Result.failure();
    }

    @GetMapping("cancel")
    @ApiOperation("删除钥匙")
    @Auth(resourceId = 23, role = RoleConstants.ADMIN, name = "删除钥匙")
    public Result cancelKey(@RequestParam("keyId") @NotNull int keyId) {
        return keyService.removeById(keyId) == 1 ?
                Result.success() : Result.failure();
    }

    @GetMapping("queryById")
    @ApiOperation("根据id查询钥匙")
    @Auth(resourceId = 24, role = RoleConstants.ADMIN, name = "根据id查询钥匙")
    public Result queryKeyById(@RequestParam("keyId") int keyId) {
        KeyVO vo = keyService.getKeyById(keyId);
        return null != vo ? Result.success(vo) : Result.failure();
    }

    @PostMapping("query")
    @ApiOperation("钥匙列表")
    @Auth(resourceId = 25, role = RoleConstants.USER, name = "钥匙列表")
    public Result queryKey(@RequestBody PageDTO dto) {
        return keyService.getKey(dto);
    }

    @GetMapping("borrow")
    @ApiOperation("借钥匙")
    @Auth(resourceId = 26, role = RoleConstants.USER, name = "借钥匙")
    public Result borrowKey(@RequestParam("keyId") int keyId) {
        return keyService.borrowKey(keyId) == 1 ? Result.success() : Result.failure();
    }

    @GetMapping("return")
    @ApiOperation("还钥匙")
    @Auth(resourceId = 27, role = RoleConstants.USER, name = "还钥匙")
    public Result returnKey(@RequestParam("keyId") int keyId) {
        return keyService.returnKey(keyId) == 1 ? Result.success() : Result.failure();
    }

}

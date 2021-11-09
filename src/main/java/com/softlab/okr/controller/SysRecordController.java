package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.service.ISysRecordService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/sysRecord")
@Api(tags = "管理员 操作日志接口")
public class SysRecordController {

    @Autowired
    private ISysRecordService sysRecordService;

    @LimitedAccess(frequency = 2, second = 30)
    @PostMapping("query")
    @ApiOperation("登录日志列表")
    @Auth(resourceId = 61, role = RoleConstants.ADMIN, name = "登录日志列表")
    public Result queryLoginLogList(@RequestBody @Validated SysRecordDTO dto) {

        return sysRecordService.getByCond(dto);
    }
}

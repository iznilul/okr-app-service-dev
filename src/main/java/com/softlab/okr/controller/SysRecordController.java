package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.model.vo.SysRecordVO;
import com.softlab.okr.service.ISysRecordService;
import com.softlab.okr.utils.Result;
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
@RequestMapping("/okr/sysRecord")
public class SysRecordController {

    @Autowired
    private ISysRecordService sysRecordService;

    @PostMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "操作记录列表")
    public Result queryLoginLogList(@RequestBody @Validated SysRecordDTO dto) {
        Page<SysRecordVO> voPage = sysRecordService.getSysRecord(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }
}

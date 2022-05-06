package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.SysRecordDTO;
import com.itlab.blog.model.vo.SysRecordVO;
import com.itlab.blog.service.ISysRecordService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/blog/sysRecord")
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
package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.service.ICsdnSpiderService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author RudeCrab
 */
@Slf4j
@RestController
@Api(tags = "通用 热榜接口")
@RequestMapping("/api/okr/rank")
public class RankController {

    @Autowired
    private ICsdnSpiderService csdnSpiderService;

    @ApiOperation("csdn实时展示")
    @GetMapping("csdn")
    @Auth(resourceId = 71, role = RoleConstants.COMMON, name = "csdn实时展示")
    public Result queryCsdn() {
        return csdnSpiderService.getAll();
    }
}
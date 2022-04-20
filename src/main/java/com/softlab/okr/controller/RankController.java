package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.service.ICsdnSpiderService;
import com.softlab.okr.utils.Result;
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
@RequestMapping("/okr/rank")
public class RankController {

    @Autowired
    private ICsdnSpiderService csdnSpiderService;

    @GetMapping("csdn")
    @Auth(role = RoleConstants.COMMON, name = "csdn实时展示")
    public Result queryCsdn() {
        return csdnSpiderService.getAll();
    }
}
package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.service.ICsdnSpiderService;
import com.itlab.blog.utils.Result;
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
@RequestMapping("/blog/rank")
public class RankController {

    @Autowired
    private ICsdnSpiderService csdnSpiderService;

    @GetMapping("csdn")
    @Auth(role = RoleConstants.COMMON, name = "csdn实时展示")
    public Result queryCsdn() {
        return csdnSpiderService.getAll();
    }
}
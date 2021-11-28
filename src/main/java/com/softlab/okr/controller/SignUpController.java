package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.config.CommonConfig;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/okr/signup")
@Api(tags = "管理员 报名接口")
public class SignUpController {

    @Autowired
    private ISignUpService signUpService;

    @Autowired
    private CommonConfig commonConfig;

    @ApiOperation("获取报名记录")
    @PostMapping("query")
    @Auth(role = RoleConstants.ADMIN, name = "获取报名记录")
    public Result querySignUp(@RequestBody SignUpDTO dto) {
        return signUpService.getSignUpByCond(dto);
    }

    @ApiOperation("更新报名记录")
    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更新报名记录")
    public Result changeSignUp(@RequestBody SignUp signUP) {

        return signUpService.modifySignUp(signUP) == 1 ?
                Result.success() : Result.failure();
    }

    @ApiOperation("导出报名单")
    @GetMapping("export")
    @Auth(role = RoleConstants.ADMIN, name = "导出报名单")
    public void exportSignUp(HttpServletResponse response) throws IOException {
        signUpService.exportSignUp(response);
    }

    @ApiOperation("报名")
    @PostMapping("add")
    @Auth(role = RoleConstants.COMMON, name = "纳新报名")
    public Result addSignUp(@RequestBody UserSignUpDTO dto) {
        return signUpService.saveSignUp(dto) == 1
                ? Result.success("报名成功，请加入纳新群: " + commonConfig.getQqGroupNumber())
                : Result.failure();
    }

    @ApiOperation("查询报名")
    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "报名结果查询")
    public Result querySignUp(@RequestParam String studentId) {
        SignUpVO signUpVO = signUpService.getSignUpById(studentId);
        return signUpVO != null ? Result.success(signUpVO) : Result.failure();
    }
}
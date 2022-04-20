package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.SignUpAddDTO;
import com.softlab.okr.model.dto.SignUpChangeDTO;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.IRecruitGroupService;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
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
@RequestMapping("/okr/signup")
public class SignUpController {

    @Autowired
    private ISignUpService signUpService;

    @Autowired
    private IRecruitGroupService recruitGroupService;

    @PostMapping("queryList")
    @Auth(role = RoleConstants.ADMIN, name = "获取报名记录")
    public Result querySignUpList(@RequestBody SignUpDTO dto) {
        return signUpService.getSignUpByList(dto);
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "更新报名记录")
    public Result changeSignUp(@RequestBody @Validated SignUpChangeDTO dto) {
        signUpService.modifySignUp(dto);
        return Result.success();
    }

    @GetMapping("export")
    @Auth(role = RoleConstants.ADMIN, name = "导出报名单")
    public void exportSignUp(HttpServletResponse response) throws IOException {
        signUpService.exportSignUp(response);
    }

    @PostMapping("add")
    @Auth(role = RoleConstants.COMMON, name = "纳新报名")
    public Result addSignUp(@RequestBody SignUpAddDTO dto) {
        return signUpService.saveSignUp(dto) == 1
                ? Result.success("报名成功，请加入纳新群: " + recruitGroupService.getOne(null).getGroupNumber())
                : Result.failure();
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "报名结果查询")
    public Result querySignUp(@RequestParam String studentId) {
        SignUpVO signUpVO = signUpService.getSignUpById(studentId);
        return signUpVO != null ? Result.success(signUpVO) : Result.failure("没有查到这个学号的报名信息");
    }
}

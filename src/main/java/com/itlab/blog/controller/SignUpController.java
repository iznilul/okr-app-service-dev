package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.SignUpAddDTO;
import com.itlab.blog.model.dto.SignUpChangeDTO;
import com.itlab.blog.model.dto.SignUpDTO;
import com.itlab.blog.model.vo.SignUpVO;
import com.itlab.blog.service.IRecruitGroupService;
import com.itlab.blog.service.ISignUpService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/blog/signup")
public class SignUpController {

    @Autowired
    private ISignUpService signUpService;

    @Autowired
    private IRecruitGroupService recruitGroupService;

    @PostMapping("queryList")
    @Auth(role = RoleConstants.ADMIN, name = "获取报名记录")
    public Result querySignUpList(@RequestBody SignUpDTO dto) {
        Page<SignUpVO> voPage = signUpService.getSignUpByList(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
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
        signUpService.saveSignUp(dto);
        return Result.success("报名成功，请加入纳新群: " + recruitGroupService.getOne(null).getGroupNumber());

    }

    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "报名结果查询")
    public Result querySignUp(@RequestParam String studentId) {
        SignUpVO signUpVO = signUpService.getSignUpById(studentId);
        return signUpVO != null ? Result.success(signUpVO) : Result.failure("没有查到这个学号的报名信息");
    }
}

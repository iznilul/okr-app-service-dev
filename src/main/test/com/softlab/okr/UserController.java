package com.softlab.okr;

import io.github.sdutsoftlab.config.SoftlabConfig;
import io.github.sdutsoftlab.model.ResultKit;
import io.github.sdutsoftlab.model.SignUp;
import io.github.sdutsoftlab.service.SignUpService;
import io.github.sdutsoftlab.utils.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: Devhui
 * @Date: 2019-11-28 17:05
 * @Version 1.0
 */

@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private SoftlabConfig softlabConfig;

    @Autowired
    private SignUpService signUpService;

    @PostMapping("post")
    @ResponseBody
    public ResultKit<Object> loginCheck(@RequestBody SignUp signUp, HttpServletRequest req) {
        ResultKit<Object> resultKit = new ResultKit<>();
        if (!signUpService.isOk("报名")) {
            resultKit.setMessage("报名尚未开始");
            return resultKit;
        }
        String exist = signUpService.isExist(signUp.getUid());
        if (exist != null) {
            resultKit.setMessage("你已报名过，请勿重复报名");
            return resultKit;
        }
        int i = signUpService.addNews(signUp);
        if (i == 1) {
            resultKit.setCode(ResultCode.SUCCESS.code());
            resultKit.setMessage("报名成功，请加入纳新群:" + softlabConfig.getQqGroupID());
        } else {
            resultKit.setCode(ResultCode.WRONG_UP.code());
            resultKit.setMessage("报名失败，请稍后重试或联系管理员");
        }
        return resultKit;
    }

    @GetMapping("query")
    @ResponseBody
    public ResultKit<Object> query(@RequestParam("uid") String uid, HttpServletRequest req) {
        ResultKit<Object> resultKit = new ResultKit<>();
        if (!signUpService.isOk("结果查询")) {
            resultKit.setMessage("结果尚未公布");
            return resultKit;
        }
        int i = signUpService.query(uid);
        resultKit.setData(i);
        if (i == 0) {
            resultKit.setCode(ResultCode.SUCCESS.code());
            resultKit.setMessage("结果审核中");
        } else if (i == 1) {
            resultKit.setCode(ResultCode.SUCCESS.code());
            resultKit.setMessage("恭喜你，已经通过面试");
        } else if (i == 2) {
            resultKit.setCode(ResultCode.SUCCESS.code());
            resultKit.setMessage("很遗憾，由于人数限制，我只通过了部分人选");
        }
        return resultKit;
    }

}

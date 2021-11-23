package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.utils.Result;

import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface ISignUpService extends IService<SignUp> {

    // 报名
    int saveSignUp(UserSignUpDTO dto);

    //录取结果更新
    int modifySignUp(SignUp signUp);

    //根据用户
    Result getSignUpByCond(SignUpDTO dto);

    //根据id返回用户
    SignUpVO getSignUpById(String studentId);

    //导出报名列表
    void exportSignUp(HttpServletResponse response) ,IOException;
}

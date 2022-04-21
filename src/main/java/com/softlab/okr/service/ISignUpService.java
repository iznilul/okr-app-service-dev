package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.SignUpAddDTO;
import com.softlab.okr.model.dto.SignUpChangeDTO;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface ISignUpService extends IService<SignUp> {

    // 报名
    void saveSignUp(SignUpAddDTO dto);

    //录取结果更新
    void modifySignUp(SignUpChangeDTO dto);

    Page<SignUpVO> getSignUpByList(SignUpDTO dto);

    //根据id返回用户
    SignUpVO getSignUpById(String studentId);

    //导出报名列表
    void exportSignUp(HttpServletResponse response) throws IOException;
}

package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface ISignUpService extends IService<SignUp> {

  // 报名
  Result saveSignUp(UserSignUpDTO dto) throws ServiceException;

  //录取结果更新
  Result modifySignUp(SignUp signUp) throws ServiceException;

  //根据用户
  List<SignUpVO> getSignUpByCond(SignUpDTO dto) throws ServiceException;

  //根据id返回用户
  Result getSignUpById(String studentId) throws ServiceException;

  //导出报名列表
  void exportSignUp(HttpServletResponse response) throws ServiceException, IOException;
}

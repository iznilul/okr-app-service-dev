package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface SignUpService {

  // 报名
  int saveSignUp(UserSignUpDTO dto) throws ServiceException;

  // 检查是否已报名
  Integer getIsExist(String id) throws ServiceException;

  //录取结果更新
  int modifySignUp(SignUp signUp) throws ServiceException;

  //根据用户
  PageInfo<SignUpVO> getSignUpByCond(SignUpDTO dto) throws ServiceException;

  //根据id返回用户
  SignUpVO getSignUpById(String studentId) throws ServiceException;

  // 拉取所有
  List<SignUpVO> getSignUp() throws ServiceException;

  void exportSignUp(HttpServletResponse response) throws ServiceException, IOException;
}

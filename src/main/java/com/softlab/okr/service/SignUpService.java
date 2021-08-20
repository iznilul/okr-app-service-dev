package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface SignUpService {

  // 报名
  int saveSignUpList(SignUp signUp) throws ServiceException;

  // 检查是否已报名
  String getIsExist(String id) throws ServiceException;

  //查询录取结果
  SignUpVO getSignUpListStatus(String id) throws ServiceException;

  //录取结果更新
  int modifySignUpList(SignUp signUp) throws ServiceException;

  //根据用户
  PageInfo<SignUp> getSignUpListByCond(SignUpDTO signUpDTO) throws ServiceException;

  //根据id返回用户
  SignUp getSignUpListById(String id) throws ServiceException;

  // 拉取所有
  List<SignUp> getSignUpList() throws ServiceException;
}

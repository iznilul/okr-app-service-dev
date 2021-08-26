package com.softlab.okr.convert.impl;

import com.softlab.okr.convert.ConvertService;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-26 17:27
 **/
@Service
public class SignUpConvert implements ConvertService<SignUp, SignUpVO> {

  @Override
  public SignUpVO convertVO(SignUp signUp) {
    SignUpVO signUpVO = new SignUpVO();
    BeanUtils.copyProperties(signUp, signUpVO);
    return signUpVO;
  }
}

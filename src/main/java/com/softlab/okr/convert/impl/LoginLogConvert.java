package com.softlab.okr.convert.impl;

import com.softlab.okr.convert.ConvertService;
import com.softlab.okr.model.entity.LoginLog;
import com.softlab.okr.model.vo.LoginLogVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
public class LoginLogConvert implements ConvertService<LoginLog, LoginLogVO> {

  @Override
  public LoginLogVO convertVO(LoginLog loginLog) {
    LoginLogVO loginLogVO = new LoginLogVO();
    BeanUtils.copyProperties(loginLog, loginLogVO);
    return loginLogVO;
  }

}

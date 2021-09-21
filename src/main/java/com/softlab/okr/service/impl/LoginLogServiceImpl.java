package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.LoginLog;
import com.softlab.okr.mapper.LoginLogMapper;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.service.ILoginLogService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements
    ILoginLogService {

  @Autowired
  private LoginLogMapper loginLogMapper;

  @Override
  public Result getByCond(LoginLogDTO dto) {
    return null;
  }

  @Override
  public Integer saveRecord(LoginLog loginLog) {
    return loginLogMapper.insert(loginLog);
  }
}

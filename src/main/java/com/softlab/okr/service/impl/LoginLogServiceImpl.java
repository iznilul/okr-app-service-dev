package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.LoginLog;
import com.softlab.okr.mapper.LoginLogMapper;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.service.ILoginLogService;
import com.softlab.okr.utils.Constants;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl extends ServiceImpl<LoginLogMapper, LoginLog> implements
    ILoginLogService {

  @Autowired
  private LoginLogMapper loginLogMapper;

  @Override
  public int saveLog(String ip, String path, String username, long duration) {
    LoginLog loginLog = new LoginLog(null, ip, path, username, Constants.DateToString(new Date()),
        duration);
    return loginLogMapper.insert(loginLog);
  }

  @Override
  public Page<LoginLog> getByCond(LoginLogDTO dto) {
    Page<LoginLog> page = new Page<>(dto.getIndex(), dto.getPageSize());
    return loginLogMapper
        .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
  }
}

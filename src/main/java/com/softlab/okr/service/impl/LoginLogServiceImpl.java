package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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
  public int saveLog(LoginLog loginLog) {
    return loginLogMapper.insert(loginLog);
  }

  @Override
  public Result getByCond(LoginLogDTO dto) {
    Page<LoginLog> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<LoginLog> loginLogPage = loginLogMapper
        .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    if (loginLogPage.getSize() == 0) {
      page.setSize(0);
      loginLogPage = loginLogMapper
          .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    }
    return Result
        .success(loginLogPage.getRecords(), loginLogPage.getCurrent(), loginLogPage.getTotal());
  }
}

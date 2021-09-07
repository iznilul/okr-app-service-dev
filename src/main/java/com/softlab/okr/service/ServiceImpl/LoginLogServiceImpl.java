package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.LoginLogMapper;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.model.entity.LoginLog;
import com.softlab.okr.service.LoginLogService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements LoginLogService {

  @Autowired
  LoginLogMapper loginLogMapper;

  @Override
  public int saveLog(String ip, String path, String username, long duration) {
    return loginLogMapper.insertLog(ip, path, username, duration);
  }

  @Override
  public List<LoginLog> list() {
    return loginLogMapper.selectList();
  }

  @Override
  public PageInfo<LoginLog> getByCond(LoginLogDTO dto) {
    PageHelper.startPage(dto.getIndex(), dto.getPageSize());
    List<LoginLog> list = loginLogMapper
        .selectByCond(dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    return new PageInfo<>(list);
  }
}

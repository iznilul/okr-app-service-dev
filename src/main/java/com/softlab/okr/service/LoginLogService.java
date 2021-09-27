package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.entity.LoginLog;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.LoginLogDTO;
import java.util.List;

public interface LoginLogService {

  int saveLog(String ip, String path, String username, long duration) throws ServiceException;

  List<LoginLog> list() throws ServiceException;

  PageInfo<LoginLog> getByCond(LoginLogDTO dto);
}

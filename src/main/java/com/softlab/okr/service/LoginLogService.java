package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.model.vo.LoginLogVO;
import java.sql.Timestamp;
import java.util.List;

public interface LoginLogService {

  int saveLog(String ip, String path, String username, long duration) throws ServiceException;

  List<LoginLogVO> list() throws ServiceException;

  PageInfo<LoginLogVO> getByCond(LoginLogDTO loginLogDTO, Timestamp beginTime, Timestamp endTime);
}

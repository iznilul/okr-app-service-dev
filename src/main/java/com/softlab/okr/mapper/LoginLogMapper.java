package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.LoginLog;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginLogMapper {

  int insertLog(String ip, String path, String username, long duration) throws DataAccessException;

  List<LoginLog> selectList() throws DataAccessException;

  List<LoginLog> selectByCond(String username, String beginTime, String endTime)
      throws DataAccessException;

}

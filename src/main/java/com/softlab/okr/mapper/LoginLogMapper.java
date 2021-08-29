package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.LoginLog;
import java.sql.Timestamp;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginLogMapper {

  int insertLog(String ip, String username, long duration) throws DataAccessException;

  List<LoginLog> selectList() throws DataAccessException;

  List<LoginLog> selectByCond(String username, Timestamp beginTime, Timestamp endTime)
      throws DataAccessException;

}

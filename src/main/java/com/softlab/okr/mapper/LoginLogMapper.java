package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.LoginLog;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginLogMapper extends BaseMapper<LoginLog> {

  List<LoginLog> selectByCond(String username, String beginTime, String endTime)
      throws DataAccessException;

}

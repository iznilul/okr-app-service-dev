package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.SysRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface SysRecordMapper extends BaseMapper<SysRecord> {

  Page<SysRecord> selectByCond(@Param("page") Page page, String username, String beginTime,
      String endTime)
      throws DataAccessException;

}

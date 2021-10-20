package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.model.vo.SysRecordVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface SysRecordMapper extends BaseMapper<SysRecord> {

  Page<SysRecordVO> selectByCond(@Param("page") Page page, String username, String beginTime,
      String endTime)
      throws DataAccessException;

}

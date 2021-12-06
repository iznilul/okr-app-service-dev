package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.model.vo.SysRecordVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface SysRecordMapper extends BaseMapper<SysRecord> {

    Page<SysRecordVO> selectSysRecord(@Param("page") Page page, String username, Date beginTime, Date endTime);
}

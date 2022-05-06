package com.itlab.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.entity.SysRecord;
import com.itlab.blog.model.vo.SysRecordVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SysRecordMapper extends BaseMapper<SysRecord> {

    Page<SysRecordVO> selectSysRecord(@Param("page") Page page, String username, String beginTime, String endTime);
}

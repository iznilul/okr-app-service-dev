package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.SysRecord;
import com.itlab.blog.model.dto.SysRecordDTO;
import com.itlab.blog.model.vo.SysRecordVO;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.Future;

public interface ISysRecordService extends IService<SysRecord> {

    Page<SysRecordVO> getSysRecord(SysRecordDTO dto);

    @Async
    Future<Integer> saveLog(SysRecord sysRecord);
}

package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.model.vo.SysRecordVO;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.Future;

public interface ISysRecordService extends IService<SysRecord> {

    Page<SysRecordVO> getSysRecord(SysRecordDTO dto);

    @Async
    Future<Integer> saveLog(SysRecord sysRecord);
}

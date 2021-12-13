package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.utils.Result;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.Future;

public interface ISysRecordService extends IService<SysRecord> {

    Result getSysRecord(SysRecordDTO dto);

    @Async
    Future<Integer> saveLog(SysRecord sysRecord);
}

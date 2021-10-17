package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.utils.Result;

public interface ISysRecordService extends IService<SysRecord> {

  Result getByCond(SysRecordDTO dto);

  int saveLog(SysRecord sysRecord);
}

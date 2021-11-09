package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.mapper.SysRecordMapper;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.model.vo.SysRecordVO;
import com.softlab.okr.service.ISysRecordService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import java.util.concurrent.Future;

@Service
public class SysRecordServiceImpl extends ServiceImpl<SysRecordMapper, SysRecord> implements
    ISysRecordService {

  @Autowired
  private SysRecordMapper sysRecordMapper;

  @Override
  public Future<Integer> saveLog(SysRecord sysRecord) {
    return new AsyncResult<Integer>(sysRecordMapper.insert(sysRecord));
  }

  @Override
  public Result getByCond(SysRecordDTO dto) {
    Page<SysRecord> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<SysRecordVO> recordPage = sysRecordMapper
        .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    return Result
            .success(recordPage.getRecords(), recordPage.getCurrent(), recordPage.getTotal());
  }
}

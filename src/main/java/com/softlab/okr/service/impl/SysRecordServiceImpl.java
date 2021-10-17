package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.mapper.SysRecordMapper;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.service.ISysRecordService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysRecordServiceImpl extends ServiceImpl<SysRecordMapper, SysRecord> implements
    ISysRecordService {

  @Autowired
  private SysRecordMapper sysRecordMapper;

  @Override
  public int saveLog(SysRecord sysRecord) {
    return sysRecordMapper.insert(sysRecord);
  }

  @Override
  public Result getByCond(SysRecordDTO dto) {
    Page<SysRecord> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<SysRecord> loginLogPage = sysRecordMapper
        .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    if (loginLogPage.getSize() == 0) {
      page.setSize(0);
      loginLogPage = sysRecordMapper
          .selectByCond(page, dto.getUsername(), dto.getBeginTime(), dto.getEndTime());
    }
    return Result
        .success(loginLogPage.getRecords(), loginLogPage.getCurrent(), loginLogPage.getTotal());
  }
}

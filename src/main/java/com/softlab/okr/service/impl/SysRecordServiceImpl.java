package com.softlab.okr.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.TimeFormat;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.SysRecord;
import com.softlab.okr.mapper.SysRecordMapper;
import com.softlab.okr.model.dto.SysRecordDTO;
import com.softlab.okr.model.vo.SysRecordVO;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.ISysRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import java.util.concurrent.Future;

@Service
public class SysRecordServiceImpl extends ServiceImpl<SysRecordMapper, SysRecord> implements
        ISysRecordService {

    @Autowired
    private SysRecordMapper sysRecordMapper;

    @Autowired
    private IResourceService resourceService;

    @Override
    public Future<Integer> saveLog(SysRecord sysRecord) {
        Resource resource = resourceService.getOne(new QueryWrapper<Resource>().eq("path", sysRecord.getPath()));
        String name = resource != null ? resource.getName() : null;
        sysRecord.setName(name);
        return new AsyncResult<Integer>(sysRecordMapper.insert(sysRecord));
    }

    @Override
    public Page<SysRecordVO> getSysRecord(SysRecordDTO dto) {
        Page<SysRecord> page = new Page<>(dto.getIndex(), dto.getPageSize());
        String beginTime = dto.getBeginTime() != null ? DateUtil.format(dto.getBeginTime(), TimeFormat.format) : null;
        String endTime = dto.getEndTime() != null ? DateUtil.format(dto.getEndTime(), TimeFormat.format) : null;
        return sysRecordMapper.selectSysRecord(page, dto.getUsername(), beginTime, endTime);
    }
}

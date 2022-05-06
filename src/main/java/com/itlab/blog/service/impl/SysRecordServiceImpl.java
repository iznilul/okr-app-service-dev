package com.itlab.blog.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.constant.TimeFormat;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.entity.SysRecord;
import com.itlab.blog.mapper.SysRecordMapper;
import com.itlab.blog.model.dto.SysRecordDTO;
import com.itlab.blog.model.vo.SysRecordVO;
import com.itlab.blog.service.IResourceService;
import com.itlab.blog.service.ISysRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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
    //@CacheEvict(cacheNames = EntityNames.SYS_RECORD, allEntries = true)
    public Future<Integer> saveLog(SysRecord sysRecord) {
        Resource resource = resourceService.getOne(new QueryWrapper<Resource>().eq("path", sysRecord.getPath()));
        String name = resource != null ? resource.getName() : null;
        sysRecord.setName(name);
        return new AsyncResult<Integer>(sysRecordMapper.insert(sysRecord));
    }

    @Override
    @Cacheable(cacheNames = EntityNames.SYS_RECORD + "#2m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<SysRecordVO> getSysRecord(SysRecordDTO dto) {
        Page<SysRecord> page = new Page<>(dto.getIndex(), dto.getPageSize());
        String beginTime = dto.getBeginTime() != null ? DateUtil.format(dto.getBeginTime(), TimeFormat.format) : null;
        String endTime = dto.getEndTime() != null ? DateUtil.format(dto.getEndTime(), TimeFormat.format) : null;
        return sysRecordMapper.selectSysRecord(page, dto.getUsername(), beginTime, endTime);
    }
}

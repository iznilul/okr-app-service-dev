package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.statusCode.ResourceStatus;
import com.softlab.okr.model.vo.ResourceVO;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IRoleResourceService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements
        IResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private IRoleResourceService roleResourceService;

    @Override
    public Result getResourceList(PageDTO dto) {
        Page<Resource> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Resource> resourcePage = resourceMapper.selectPage(page, null);
        List<ResourceVO> list = new ArrayList<>();
        resourcePage.getRecords().forEach(resource -> {
            ResourceVO vo = new ResourceVO();
            BeanUtils.copyProperties(resource, vo);
            vo.setStatusName(ResourceStatus.getMessage(resource.getStatus()));
            list.add(vo);
        });
        return Result.success(list, resourcePage.getCurrent(), resourcePage.getTotal());
    }

    @Override
    @Transactional(
            propagation = Propagation.REQUIRED,
            isolation = Isolation.READ_COMMITTED,
            rollbackFor = Exception.class)
    public int modifyResourceStatus(int id) {
        ApiFilter.updateResources(id);
        return resourceMapper.updateResourceStatus(id);
    }

    @Override
    public Set<Integer> getResourceByUserId(int userId) {
        return resourceMapper.selectByUserId(userId);
    }
}

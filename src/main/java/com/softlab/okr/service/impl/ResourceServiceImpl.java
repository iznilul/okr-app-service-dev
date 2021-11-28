package com.softlab.okr.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.TimeFormat;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.statusCode.ResourceStatus;
import com.softlab.okr.model.enums.statusCode.RoleStatus;
import com.softlab.okr.model.vo.ResourceVO;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IUserRoleService;
import com.softlab.okr.utils.CopyUtil;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
    private IUserRoleService userRoleService;

    @Override
    public Result getResourceList(PageDTO dto) {
        Page<Resource> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Resource> resourcePage = resourceMapper.selectPage(page, null);
        List<ResourceVO> list = new ArrayList<>();
        resourcePage.getRecords().forEach(resource -> {
            ResourceVO vo = CopyUtil.copy(resource, ResourceVO.class);
            vo.setStatusName(ResourceStatus.getMessage(resource.getStatus()));
            list.add(vo);
        });
        return Result.success(list, resourcePage.getCurrent(), resourcePage.getTotal());
    }

    @Override
    @Transactional
    public int modifyResourceStatus(int resourceId) {
        ApiFilter.updateResources(resourceId);
        return resourceMapper.updateResourceStatus(resourceId);
    }

    @Override
    @Transactional
    public Set<String> getResourceByUserId(int userId) {
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>()
                .eq("user_id", userId));
        long time = System.currentTimeMillis();
        if (userRole.getExpireTime().getTime() < time) {
            userRole.setRoleId(RoleStatus.MEMBER.code());
            userRole.setExpireTime(DateUtil.parse(TimeFormat.neverExpire));
            userRoleService.updateById(userRole);
        }
        return resourceMapper.selectByUserId(userId);
    }
}

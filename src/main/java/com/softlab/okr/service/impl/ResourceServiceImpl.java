package com.softlab.okr.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.TimeFormat;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.model.enums.ResourceEnum;
import com.softlab.okr.model.enums.RoleEnum;
import com.softlab.okr.model.exception.BusinessException;
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
    public Result getResourceList(ResourceDTO dto) {
        Page<Resource> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Resource> resourcePage = resourceMapper.selectPage(page, new QueryWrapper<Resource>()
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .orderByAsc("status"));
        List<ResourceVO> list = new ArrayList<>();
        resourcePage.getRecords().forEach(resource -> {
            ResourceVO vo = CopyUtil.copy(resource, ResourceVO.class);
            vo.setResourceId(String.valueOf(resource.getResourceId()));
            vo.setStatusName(ResourceEnum.getMessage(resource.getStatus()));
            vo.setRoleName(RoleEnum.getMessage(resource.getRole()));
            list.add(vo);
        });
        return Result.success(list, resourcePage.getCurrent(), resourcePage.getTotal());
    }

    @Override
    @Transactional
    public int modifyResourceStatus(String id) {
        long resourceId = Long.parseLong(id);
        ApiFilter.updateResources(resourceId);
        return resourceMapper.updateResourceStatus(resourceId);
    }

    @Override
    public Set<String> getResourceByUserId(int userId) {
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>()
                .eq("user_id", userId));
        long time = System.currentTimeMillis();
        long expireTime = userRole.getExpireTime().getTime();
        if (expireTime < time) {
            userRole.setRoleId(RoleEnum.USER.code());
            userRole.setExpireTime(DateUtil.parse(TimeFormat.neverExpire));
            userRoleService.updateById(userRole);
            throw new BusinessException("??????????????? ???????????????");
        }
        return resourceMapper.selectByUserId(userId);
    }

    @Override
    public List<String> getResourceName(String name) {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", name).select("name");
        List<String> result = new ArrayList<>();
        List<Resource> resourceList = resourceMapper.selectList(queryWrapper);
        resourceList.forEach(resource -> {
            result.add(resource.getName());
        });
        return result;
    }
}

package com.itlab.blog.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.constant.TimeFormat;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.entity.UserRole;
import com.itlab.blog.mapper.ResourceMapper;
import com.itlab.blog.model.dto.ResourceDTO;
import com.itlab.blog.model.enums.ResourceEnum;
import com.itlab.blog.model.enums.RoleEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.model.vo.ResourceVO;
import com.itlab.blog.security.ApiFilter;
import com.itlab.blog.service.IResourceService;
import com.itlab.blog.service.IUserRoleService;
import com.itlab.blog.utils.CopyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

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
    @Cacheable(cacheNames = EntityNames.RESOURCE + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<ResourceVO> getResourceList(ResourceDTO dto) {
        Page<Resource> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Resource> resourcePage = resourceMapper.selectPage(page, new QueryWrapper<Resource>()
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .orderByAsc("status"));
        Page<ResourceVO> voPage = new Page<>();
        List<ResourceVO> list = new ArrayList<>();
        resourcePage.getRecords().forEach(resource -> {
            ResourceVO vo = CopyUtil.copy(resource, ResourceVO.class);
            vo.setResourceId(String.valueOf(resource.getResourceId()));
            vo.setStatusName(ResourceEnum.getMessage(resource.getStatus()));
            vo.setRoleName(RoleEnum.getMessage(resource.getRole()));
            list.add(vo);
        });
        voPage.setRecords(list);
        voPage.setCurrent(resourcePage.getCurrent());
        voPage.setTotal(resourcePage.getTotal());
        return voPage;
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.RESOURCE, allEntries = true)
    public void modifyResourceStatus(String id) {
        long resourceId = Long.parseLong(id);
        ApiFilter.updateResources(resourceId);
        resourceMapper.updateResourceStatus(resourceId);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.RESOURCE + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Set<String> getResourceByUserId(int userId) {
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>()
                .eq("user_id", userId));
        long time = System.currentTimeMillis();
        long expireTime = userRole.getExpireTime().getTime();
        if (expireTime < time) {
            userRole.setRoleId(RoleEnum.USER.code());
            userRole.setExpireTime(DateUtil.parse(TimeFormat.neverExpire));
            userRoleService.updateById(userRole);
            throw new BusinessException("权限已到期 请重新登录");
        }
        return resourceMapper.selectByUserId(userId);
    }
}

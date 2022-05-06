package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.entity.RoleResource;
import com.itlab.blog.mapper.RoleResourceMapper;
import com.itlab.blog.model.enums.RoleEnum;
import com.itlab.blog.service.IRoleResourceService;
import com.itlab.blog.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * <p>
 * 角色-权限关系 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Service
public class RoleResourceServiceImpl extends
        ServiceImpl<RoleResourceMapper, RoleResource> implements IRoleResourceService {

    @Autowired
    private IRoleService roleService;

    @Override
    @Transactional
    public void reloadRoleResource(List<Resource> list) {
        Set<Long> resourceSet = new HashSet<>();
        List<RoleEnum> roleEnumList = RoleEnum.getListOrderByDesc();
        List<RoleResource> result = new ArrayList<>();
        this.remove(null);
        for (RoleEnum status : roleEnumList) {
            Set<Long> set = list.stream().filter(resource -> resource.getRole().equals(status.role()))
                    .map(Resource::getResourceId).collect(Collectors.toSet());
            resourceSet.addAll(set);
            result.addAll(this.buildRoleResourceList(status.code(), resourceSet));
        }
        this.saveBatch(result);
    }

    private List<RoleResource> buildRoleResourceList(Integer roleId, Set<Long> set) {
        return set.stream().map(resource ->
        {
            RoleResource roleResource = new RoleResource();
            roleResource.setId(null);
            roleResource.setRoleId(roleId);
            roleResource.setResourceId(resource);
            return roleResource;
        }).collect(Collectors.toList());
    }

}

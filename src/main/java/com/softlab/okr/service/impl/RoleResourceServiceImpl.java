package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.Role;
import com.softlab.okr.entity.RoleResource;
import com.softlab.okr.mapper.RoleResourceMapper;
import com.softlab.okr.service.IRoleResourceService;
import com.softlab.okr.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
    public List<RoleResource> buildRoleResourceList(Integer roleId, Set<Integer> set) {
        return set.stream().map(resource ->
        {
            RoleResource roleResource = new RoleResource();
            roleResource.setId(null);
            roleResource.setRoleId(roleId);
            roleResource.setResourceId(resource);
            return roleResource;
        }).collect(Collectors.toList());
    }

    @Override
    @Transactional(
            propagation = Propagation.REQUIRED,
            isolation = Isolation.READ_COMMITTED,
            rollbackFor = Exception.class)
    public boolean reloadRoleResource(List<Resource> list) {
        List<Role> roleList = roleService.list();
        this.remove(null);
        for (Role role : roleList) {
            Set<Integer> set = list.stream().filter(resource -> resource.getRole().equals(role.getRole()))
                    .map(Resource::getId).collect(Collectors.toSet());
            List<RoleResource> result = this.buildRoleResourceList(role.getRoleId(), set);
            if (!this.saveBatch(result)) {
                return false;
            }
        }
        return true;
    }

}

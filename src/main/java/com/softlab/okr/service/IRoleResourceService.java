package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.RoleResource;

import java.util.List;

/**
 * <p>
 * 角色-权限关系 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IRoleResourceService extends IService<RoleResource> {

    void reloadRoleResource(List<Resource> list);
}

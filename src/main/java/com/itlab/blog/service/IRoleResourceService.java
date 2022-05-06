package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.entity.RoleResource;

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

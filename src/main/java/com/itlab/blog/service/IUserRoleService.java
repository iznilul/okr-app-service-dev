package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.UserRole;
import com.itlab.blog.model.dto.GrantRoleDTO;

/**
 * <p>
 * 用户-角色关系表 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IUserRoleService extends IService<UserRole> {

    void grantRole(GrantRoleDTO dto);
}

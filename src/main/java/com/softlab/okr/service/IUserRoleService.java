package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.model.dto.GrantRoleDTO;

/**
 * <p>
 * 用户-角色关系表 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IUserRoleService extends IService<UserRole> {

    Boolean grantRole(GrantRoleDTO dto);
}

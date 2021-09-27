package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Role;
import com.softlab.okr.entity.RoleResource;
import com.softlab.okr.exception.ServiceException;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * 角色-权限关系 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IRoleResourceService extends IService<RoleResource> {

  List<RoleResource> buildRoleResourceList(Integer roleId, Set<Integer> resourceIdList)
      throws ServiceException;

  boolean reloadRoleResource(List<Role> roleList) throws ServiceException;

}

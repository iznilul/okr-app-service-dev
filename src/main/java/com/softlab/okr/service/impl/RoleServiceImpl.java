package com.softlab.okr.service.impl;

import com.softlab.okr.entity.Role;
import com.softlab.okr.mapper.RoleMapper;
import com.softlab.okr.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements RoleService {

  @Autowired
  RoleMapper roleMapper;

  @Override
  public void saveUserRole(int userId, int roleId) {
    roleMapper.insertUserRole(userId, roleId);
  }

  @Override
  public int getRoleId(String name) {
    Role role = roleMapper.selectByName(name);
    return role.getRoleId();
  }
}

package com.softlab.okr.mapper;

import com.softlab.okr.entity.Role;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleMapper {

  Role selectByRoleId(int roleId) throws DataAccessException;

  Role selectByName(String name) throws DataAccessException;

  int insertUserRole(int userId, int roleId) throws DataAccessException;

}

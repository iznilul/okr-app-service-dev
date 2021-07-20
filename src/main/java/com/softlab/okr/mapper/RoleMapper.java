package com.softlab.okr.mapper;

import com.softlab.okr.exception.MapperException;
import com.softlab.okr.model.entity.Role;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleMapper {

    Role selectByRoleId(int roleId) throws MapperException;

    Role selectByName(String name) throws MapperException;

    void insertUserRole(int userId, int roleId) throws MapperException;

}

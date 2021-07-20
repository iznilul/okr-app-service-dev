package com.softlab.okr.mapper;

import com.softlab.okr.exception.MapperException;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface ResourceMapper {


    void insertResources(List<Resource> resourceList) throws MapperException;

    void deleteByType(int type) throws MapperException;

    Set<Integer> selectByUserId(Integer userId) throws MapperException;

    void insertRoleResource(RoleResourceBo roleResourceBo) throws MapperException;

    void deleteRoleResource(int roleId) throws MapperException;
}

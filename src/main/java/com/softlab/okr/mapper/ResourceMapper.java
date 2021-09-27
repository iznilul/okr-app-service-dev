package com.softlab.okr.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

  //Set<Integer> selectByUserId(Integer userId) throws DataAccessException;

  //int insertRoleResource(RoleResourceBo roleResourceBo) throws DataAccessException;

  //int deleteRoleResource(int roleId) throws DataAccessException;

  int updateResourceStatus(int resourceId) throws DataAccessException;
}

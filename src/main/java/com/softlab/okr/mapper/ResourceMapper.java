package com.softlab.okr.mapper;


import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.model.vo.ResourceVO;
import java.util.List;
import java.util.Set;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceMapper {


  int insertResource(List<Resource> resourceList) throws DataAccessException;

  int deleteList() throws DataAccessException;

  Resource selectResourceByPath(String path) throws DataAccessException;

  Resource selectResourceById(int resourceId) throws DataAccessException;

  Set<Integer> selectByUserId(Integer userId) throws DataAccessException;

  List<ResourceVO> selectResourceList() throws DataAccessException;

  int insertRoleResource(RoleResourceBo roleResourceBo) throws DataAccessException;

  int deleteRoleResource(int roleId) throws DataAccessException;

  int updateResourceStatus(int resourceId) throws DataAccessException;
}

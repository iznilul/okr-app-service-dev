package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface ResourceService {

  int saveResources(List<Resource> resourceList) throws ServiceException;

  int saveRoleResource(RoleResourceBo roleResourceBo) throws ServiceException;

  int removeList() throws ServiceException;

  Resource getResourceByPath(String path) throws ServiceException;

  List<Integer> getResourceIds(String role) throws ServiceException;

  int reloadRoleResource(RoleResourceBo roleResourceBo) throws ServiceException;

  int modifyResourceStatus(int resourceId) throws ServiceException;

  void appStartLoad(List<Resource> list) throws ServiceException;

  Set<Resource> filterResource(Collection<Resource> list) throws ServiceException;
}

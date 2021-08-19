package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;

import java.util.List;


public interface ResourceService {

    void saveResources(List<Resource> resourceList) throws ServiceException;

    void saveRoleResource(RoleResourceBo roleResourceBo) throws ServiceException;

    void removeByType(int type) throws ServiceException;

    List<Integer> getResourceIds(String role) throws ServiceException;

    void reloadRoleResource(RoleResourceBo roleResourceBo) throws ServiceException;
}

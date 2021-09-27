package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.utils.Result;
import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface IResourceService extends IService<Resource> {

  Result getResourceList(PageDTO dto) throws ServiceException;

  int modifyResourceStatus(int resourceId) throws ServiceException;

  Set<Integer> getResourceIds(String role) throws ServiceException;

  void appStartLoad(List<Resource> list) throws ServiceException;

  Set<Resource> filterResource(Collection<Resource> list) throws ServiceException;

  Set<Integer> getResourceByUserId(int userId) throws ServiceException;
}

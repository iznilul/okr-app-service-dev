package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.entity.Switch;

import java.util.List;

public interface SwitchService {

  List<Switch> getList() throws ServiceException;

  int modifyStatus(String name) throws ServiceException;

  Integer getStatus(String name) throws ServiceException;

  int removeByName(String name) throws ServiceException;

  int saveSwitch(String name) throws ServiceException;
}

package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.entity.Key;
import java.util.List;

public interface KeyService {

  int saveKey(String keyName) throws ServiceException;

  int modifyKey(int keyId, String keyName) throws ServiceException;

  int saveKeyUser(int keyId, int userId) throws ServiceException;

  int removeById(int keyId) throws ServiceException;

  int removeByUserId(int keyId, int userId) throws ServiceException;

  List<Key> list() throws ServiceException;
}

package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.utils.Result;

public interface IKeyService {

  Result saveKey(String keyName) throws ServiceException;

  Result modifyKey(int keyId, String keyName) throws ServiceException;

  Result removeById(int keyId) throws ServiceException;

  Result getKey() throws ServiceException;
}

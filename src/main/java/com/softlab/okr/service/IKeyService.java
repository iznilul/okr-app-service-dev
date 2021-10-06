package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Key;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.utils.Result;

public interface IKeyService extends IService<Key> {

  int saveKey(String keyName) throws ServiceException;

  int modifyKey(KeyDTO dto) throws ServiceException;

  int removeById(int keyId) throws ServiceException;

  Result getKey(PageDTO dto) throws ServiceException;

  KeyVO getKeyById(int keyId) throws ServiceException;

  int borrowKey(int keyId);

  int returnKey(int keyId);
}

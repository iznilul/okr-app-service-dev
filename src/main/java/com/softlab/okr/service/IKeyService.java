package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Key;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyVO;

public interface IKeyService extends IService<Key> {

  int saveKey(String keyName) throws ServiceException;

  int modifyKey(int keyId, String keyName) throws ServiceException;

  int removeById(int keyId) throws ServiceException;

  Page<KeyVO> getKey(PageDTO dto) throws ServiceException;
}

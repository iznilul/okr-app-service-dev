package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Key;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyMapper;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.statusCode.KeyStatus;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class KeyServiceImpl extends ServiceImpl<KeyMapper, Key> implements IKeyService {

  @Autowired
  private KeyMapper keyMapper;

  @Autowired
  private IKeyUserService keyUserService;

  @Autowired
  private IAuthenticationService authenticationService;

  @Override
  public int saveKey(String keyName) {
    Key key = new Key(null, keyName, 0);
    return keyMapper.insert(key);
  }

  @Override
  public int modifyKey(KeyDTO dto) {
    Key key = new Key();
    BeanUtils.copyProperties(dto, key);
    key.setStatus(KeyStatus.getCode(dto.getStatusName()));
    return keyMapper.updateById(key);
  }

  @Override
  public boolean removeById(int keyId) {
    return (keyMapper.deleteById(keyId) == 1) && keyUserService
        .remove(new QueryWrapper<KeyUser>().eq("key_id", keyId));
  }

  @Override
  public Result getKey(PageDTO dto) {
    Page<Key> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<KeyVO> voPage = keyMapper.getKey(page);
    if (voPage.getSize() == 0) {
      page.setCurrent(1);
      voPage = keyMapper.getKey(page);
    }
    return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
  }

  @Override
  @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public int borrowKey(int keyId) {
    if (keyMapper.update(null, new UpdateWrapper<Key>().eq("key_id", keyId).set("status", 1))
        == 0) {
      return 0;
    }
    Integer userId = authenticationService.getUserId();
    return keyUserService.saveKeyUser(keyId, userId);
  }

  @Override
  @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public int returnKey(int keyId) {
    if (keyMapper.update(null, new UpdateWrapper<Key>().eq("key_id", keyId).set("status", 0))
        == 0) {
      return 0;
    }
    Integer userId = authenticationService.getUserId();
    return keyUserService.modifyKeyUser(keyId, userId, 1);
  }
}

package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.dao.KeyMapper;
import com.softlab.okr.model.entity.Key;
import com.softlab.okr.service.KeyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyServiceImpl implements KeyService {

  @Autowired
  KeyMapper keyMapper;

  @Override
  public int saveKey(String keyName) {
    return keyMapper.insertKey(keyName);
  }

  @Override
  public int modifyKey(int keyId, String keyName) {
    return keyMapper.updateKey(keyId, keyName);
  }

  @Override
  public int saveKeyUser(int keyId, int userId) {
    return keyMapper.insertUser(keyId, userId);
  }

  @Override
  public int removeById(int keyId) {
    return keyMapper.deleteById(keyId);
  }

  @Override
  public int removeByUserId(int keyId, int userId) {
    return keyMapper.deleteByUserId(keyId, userId);
  }

  @Override
  public List<Key> list() {
    return keyMapper.selectList();
  }
}

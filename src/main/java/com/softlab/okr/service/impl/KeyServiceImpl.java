package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Key;
import com.softlab.okr.mapper.KeyMapper;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.utils.Result;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyServiceImpl extends ServiceImpl<KeyMapper, Key> implements IKeyService {

  @Autowired
  private KeyMapper keyMapper;

  @Override
  public Result saveKey(String keyName) {
    Key key = new Key(null, keyName);
    int flag = keyMapper.insert(key);
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result modifyKey(int keyId, String keyName) {
    Key key = new Key(keyId, keyName);
    int flag = keyMapper.updateById(key);
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result removeById(int keyId) {
    int flag = keyMapper.deleteById(keyId);
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result getKey() {
    List<KeyVO> list = keyMapper.selectKey();
    return Result.success(list);
  }
}

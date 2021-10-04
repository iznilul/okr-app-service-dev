package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Key;
import com.softlab.okr.mapper.KeyMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyServiceImpl extends ServiceImpl<KeyMapper, Key> implements IKeyService {

  @Autowired
  private KeyMapper keyMapper;

  @Override
  public int saveKey(String keyName) {
    Key key = new Key(null, keyName);
    return keyMapper.insert(key);
  }

  @Override
  public int modifyKey(Key key) {
    return keyMapper.updateById(key);
  }

  @Override
  public int removeById(int keyId) {
    return keyMapper.deleteById(keyId);
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
}

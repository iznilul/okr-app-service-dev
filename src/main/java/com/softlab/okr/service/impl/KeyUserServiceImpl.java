package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyUserMapper;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Service
public class KeyUserServiceImpl extends ServiceImpl<KeyUserMapper, KeyUser> implements
    IKeyUserService {

  @Autowired
  private KeyUserMapper keyUserMapper;

  public Result saveKeyUser(int keyId, int userId) {
    KeyUser keyUser = new KeyUser(keyId, userId);
    int flag = keyUserMapper.insert(keyUser);
    return flag == 1 ? Result.success() : Result.failure();
  }

  public Result removeByUserId(int keyId, int userId) {
    int flag = keyUserMapper.delete(new QueryWrapper<KeyUser>()
        .eq("key_id", keyId).eq("user_id", userId));
    return flag == 1 ? Result.success() : Result.failure();
  }
}

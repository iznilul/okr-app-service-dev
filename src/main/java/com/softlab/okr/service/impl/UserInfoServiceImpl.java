package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

@Service
@Transactional
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements
    IUserInfoService {

  @Autowired
  private UserInfoMapper userInfoMapper;

  @Autowired
  private IUserEntityService userEntityService;

  @Override
  public int saveUserInfo(int userId, String username) {
    UserInfo userInfo = new UserInfo(userId, username, null, null, null, null, null, null, null);
    return userInfoMapper.insert(userInfo);
  }

  @Override
  public UserInfo getUserInfo(String username) {
    return userInfoMapper.selectOne(new QueryWrapper<UserInfo>()
        .eq("username", username));
  }

  @Override
  public Result getUserInfoByCond(SelectUserDTO dto) {
    Page<UserInfo> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<UserInfo> userInfoPage = userInfoMapper.selectPage(page, new QueryWrapper<UserInfo>()
        .eq(StringUtils.isNotBlank(dto.getUsername()), "username", dto.getUsername())
        .like(StringUtils.isNotBlank(dto.getName()), "name", dto.getName())
        .like(StringUtils.isNotBlank(dto.getMajor()), "major", dto.getMajor()));
    return Result.success(userInfoPage.getRecords(), userInfoPage.getTotal());
  }

  @Override
  public int modifyUserInfo(UpdateUserDTO dto) {
    Integer userId = userEntityService.getByUsername(dto.getUsername()).getUserId();
    if (null == userId) {
      return 0;
    } else {
      UserInfo userInfo = new UserInfo();
      BeanUtils.copyProperties(dto, userInfo);
      userInfo.setUserId(userId);
      return userInfoMapper.updateById(userInfo);
    }
  }

  @Override
  public int uploadAvatar(String username, String avatar) {
    return userInfoMapper.update(null, new UpdateWrapper<UserInfo>()
        .eq("username", username)
        .set("avatar", avatar));
  }
}

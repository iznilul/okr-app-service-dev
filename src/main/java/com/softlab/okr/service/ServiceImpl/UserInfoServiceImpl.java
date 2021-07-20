package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.entity.UserInfo;
import com.softlab.okr.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

@Service
@Transactional(readOnly = false)
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public UserEntity loginCheck(LoginDTO loginDto) {
        return userInfoMapper.selectByLogin(loginDto);
    }

    @Override
    public void addUserInfo(int userId, String username, long createTime, long updateTime) {
        userInfoMapper.insertUserInfo(userId, username, createTime, updateTime);
    }

    @Override
    public UserInfo getUserInfoByUsername(String username) {
        return userInfoMapper.selectUserInfoByUsername(username);
    }

    @Override
    public PageInfo<UserInfo> getUserInfoByCond(SelectUserDTO selectUserDto,
                                                int pageSize) {
        PageHelper.startPage(selectUserDto.getIndex(), pageSize);
        List<UserInfo> userInfoList = userInfoMapper.selectUserInfoByCond(selectUserDto);
        return new PageInfo<>(userInfoList);
    }

    @Override
    public int modifyUserInfo(UpdateUserDTO updateUserDto, long updateTime) {
        return userInfoMapper.updateUserInfo(updateUserDto, updateTime);
    }

    @Override
    public int uploadAvatar(String username, String avatar) {
        return userInfoMapper.uploadAvatar(username, avatar);
    }

    @Override
    public int modifyPassword(String username, String password) {
        return userInfoMapper.updatePassword(username, password);
    }
}

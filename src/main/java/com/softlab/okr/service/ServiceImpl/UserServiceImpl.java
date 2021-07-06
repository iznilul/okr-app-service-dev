package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.mapper.UserMapper;
import com.softlab.okr.model.User;
import com.softlab.okr.service.UserService;
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
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User loginCheck(String account, String password) {
        return userMapper.loginCheck(account, password);
    }

    @Override
    public User selectUser(String account) {
        return userMapper.selectUser(account);
    }

    @Override
    public List<User> selectByCond(String role, String account, String userName, String major) {
        return userMapper.selectByCond(role, account, userName, major);
    }

    @Override
    public int updateUser(String account, String userName, String major, String qq, String phone, String weixin, String desc, long updateTime) {
        return userMapper.updateUser(account, userName, major, qq, phone, weixin, desc, updateTime);
    }

    @Override
    public int register(String role, String account, String password, long createTime, long updateTime) {
        return userMapper.register(role, account, password, createTime, updateTime);
    }

    @Override
    public int uploadAvatar(String account, String avatar) {
        return userMapper.uploadAvatar(account, avatar);
    }

    @Override
    public int verifyPassword(String account, String password, long updateTime) {
        return userMapper.verifyPassword(account, password, updateTime);
    }
}

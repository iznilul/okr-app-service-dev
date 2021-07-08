package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.bo.RegisterBo;
import com.softlab.okr.dto.user.LoginDto;
import com.softlab.okr.dto.user.SelectUserDto;
import com.softlab.okr.dto.user.UpdateUserDto;
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
    public User loginCheck(LoginDto loginDto) {
        return userMapper.loginCheck(loginDto);
    }

    @Override
    public User selectUser(String account) {
        return userMapper.selectUser(account);
    }

    @Override
    public PageInfo<User> selectByCond(SelectUserDto selectUserDto,
                                       int pageSize) {
        PageHelper.startPage(selectUserDto.getIndex(), pageSize);
        List<User> userList = userMapper.selectByCond(selectUserDto);
        return new PageInfo<>(userList);
    }

    @Override
    public int updateUser(UpdateUserDto updateUserDto, long updateTime) {
        return userMapper.updateUser(updateUserDto, updateTime);
    }

    @Override
    public int register(RegisterBo registerBo) {
        return userMapper.register(registerBo);
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

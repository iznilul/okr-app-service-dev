package com.softlab.okr.service;

import com.softlab.okr.model.User;

import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface UserService {
    // 登陆检查
    User loginCheck(String account, String password);

    User selectUser(String account);

    List<User> selectByCond(String role, String account, String userName, String major);

    int updateUser(String account, String userName, String major, String qq, String phone,String weixin,String desc,long updateTime);

    int register(String role, String account, String password, long createTime, long updateTime);

    int uploadAvatar(String account, String avatar);

    int verifyPassword(String account,String password,long updateTime);
}

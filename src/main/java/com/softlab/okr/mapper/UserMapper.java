package com.softlab.okr.mapper;

/**
 * @Author: Devhui
 * @Date: 2019-11-28 17:05
 * @Version 1.0
 */

import com.softlab.okr.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    // 登陆检查
    User loginCheck(String account, String password);

    User selectUser(String account);

    List<User> selectByCond(User user);

    int updateUser(String account, String userName, String major, String qq, String phone, String weixin, String desc, long updateTime);

    int register(Integer role, String account, String password, long createTime, long updateTime);

    int uploadAvatar(String account, String avatar);

    int verifyPassword(String account,String password,long updateTime);
}

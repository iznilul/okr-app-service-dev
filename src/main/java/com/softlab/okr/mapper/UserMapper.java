package com.softlab.okr.mapper;

/**
 * @Author: Devhui
 * @Date: 2019-11-28 17:05
 * @Version 1.0
 */

import com.softlab.okr.bo.RegisterBo;
import com.softlab.okr.dto.user.LoginDto;
import com.softlab.okr.dto.user.SelectUserDto;
import com.softlab.okr.dto.user.UpdateUserDto;
import com.softlab.okr.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    // 登陆检查
    User loginCheck(LoginDto loginDto);

    User selectUser(String account);

    List<User> selectByCond(SelectUserDto selectUserDto);

    int updateUser(@Param("updateUserDto") UpdateUserDto updateUserDto,
                   @Param("updateTime") long updateTime);

    int register(RegisterBo registerBo);

    int uploadAvatar(String account, String avatar);

    int verifyPassword(String account,String password,long updateTime);
}

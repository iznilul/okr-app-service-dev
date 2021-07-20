package com.softlab.okr.mapper;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

import com.softlab.okr.exception.MapperException;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.entity.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoMapper {
    // 登陆检查
    UserEntity selectByLogin(LoginDTO loginDto) throws MapperException;

    void insertUserInfo(int userId, String username, long createTime, long updateTime) throws MapperException;

    UserInfo selectUserInfoByUsername(String username) throws MapperException;

    List<UserInfo> selectUserInfoByCond(SelectUserDTO selectUserDto) throws MapperException;

    int updateUserInfo(
            @Param("updateUserDto") UpdateUserDTO updateUserDto,
            @Param("updateTime") long updateTime) throws MapperException;

    int register(RegisterBo registerBo) throws MapperException;

    int uploadAvatar(String username, String avatar) throws MapperException;

    int updatePassword(String username, String password) throws MapperException;
}

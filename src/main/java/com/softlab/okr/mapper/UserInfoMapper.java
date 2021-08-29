package com.softlab.okr.mapper;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.entity.UserInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoMapper {
    // 登陆检查
    UserEntity selectByLogin(LoginDTO loginDto) throws DataAccessException;

    int insertUserInfo(int userId, String username, long createTime, long updateTime)
            throws DataAccessException;

    UserInfo selectUserInfoByUsername(String username) throws DataAccessException;

    List<UserInfo> selectUserInfoByCond(SelectUserDTO selectUserDto) throws DataAccessException;

    String selectNameById(int userId) throws DataAccessException;

    int updateUserInfo(
            @Param("updateUserDto") UpdateUserDTO updateUserDto,
            @Param("updateTime") long updateTime)
            throws DataAccessException;

    int register(RegisterBo registerBo) throws DataAccessException;

    int uploadAvatar(String username, String avatar) throws DataAccessException;

    int updatePassword(String username, String password) throws DataAccessException;
}

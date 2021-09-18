package com.softlab.okr.dao;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.entity.UserInfo;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInfoMapper {

  // 登陆检查
  UserEntity selectByLogin(LoginDTO loginDto) throws DataAccessException;

  int insertUserInfo(int userId, String username)
      throws DataAccessException;

  UserInfo selectUserInfoByUsername(String username) throws DataAccessException;

  List<UserInfo> selectUserInfoByCond(SelectUserDTO dto) throws DataAccessException;

  String selectNameById(int userId) throws DataAccessException;

  int updateUserInfo(
      @Param("dto") UpdateUserDTO dto)
      throws DataAccessException;

  int register(RegisterBo registerBo) throws DataAccessException;

  int uploadAvatar(String username, String avatar) throws DataAccessException;

  int updatePassword(String username, String password) throws DataAccessException;
}

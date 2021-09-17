package com.softlab.okr.dao;

import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.entity.UserEntity;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityMapper {

  UserEntity selectByUsername(String username) throws DataAccessException;

  int updatePassword(String newPassword) throws DataAccessException;

  int register(RegisterBo registerBo) throws DataAccessException;

  int deleteByUsername(String username) throws DataAccessException;
}

package com.softlab.okr.mapper;

import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.model.bo.RegisterBo;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityMapper {

  UserEntity selectByUsername(String username) throws DataAccessException;

  int updatePassword(String newPassword) throws DataAccessException;

  int register(RegisterBo registerBo) throws DataAccessException;

  int deleteByUsername(String username) throws DataAccessException;
}

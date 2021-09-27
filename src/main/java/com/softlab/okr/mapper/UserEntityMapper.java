package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.UserEntity;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityMapper extends BaseMapper<UserEntity> {

  int deleteByUsername(String username) throws DataAccessException;
}

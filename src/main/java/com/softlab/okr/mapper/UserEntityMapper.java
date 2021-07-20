package com.softlab.okr.mapper;

import com.softlab.okr.exception.MapperException;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.entity.UserEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface UserEntityMapper {

    UserEntity selectByUsername(String username) throws MapperException;

    void updatePassword(String newPassword) throws MapperException;

    int register(RegisterBo registerBo) throws MapperException;
}

package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.UserEntity;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface UserEntityMapper extends BaseMapper<UserEntity> {

    int deleteByUsername(String username);

    Map<String, Object> selectUserEntity(String username);
}

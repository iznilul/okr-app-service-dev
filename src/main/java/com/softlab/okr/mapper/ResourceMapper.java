package com.softlab.okr.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Resource;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

    int updateResourceStatus(Long resourceId) throws DataAccessException;

    Set<String> selectByUserId(int userId) throws DataAccessException;
}

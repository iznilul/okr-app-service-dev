package com.softlab.okr.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Resource;
import java.util.Set;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

  int updateResourceStatus(int resourceId) throws DataAccessException;

  Set<Integer> selectByUserId(int userId) throws DataAccessException;
}

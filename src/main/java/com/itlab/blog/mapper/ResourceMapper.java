package com.itlab.blog.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itlab.blog.entity.Resource;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

    int updateResourceStatus(Long resourceId);

    Set<String> selectByUserId(int userId);
}

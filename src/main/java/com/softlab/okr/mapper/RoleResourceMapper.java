package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.RoleResource;
import java.util.Set;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 角色-权限关系 Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Repository
public interface RoleResourceMapper extends BaseMapper<RoleResource> {

  Set<Integer> selectByUserId(Integer userId) throws DataAccessException;

}

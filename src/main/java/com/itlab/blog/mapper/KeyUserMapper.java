package com.itlab.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.entity.KeyUser;
import com.itlab.blog.model.vo.KeyUserVO;
import org.springframework.stereotype.Repository;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Repository
public interface KeyUserMapper extends BaseMapper<KeyUser> {

  Page<KeyUserVO> selectKeyUserVO(Page<KeyUser> page);
}

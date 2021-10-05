package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.model.vo.KeyUserVO;
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

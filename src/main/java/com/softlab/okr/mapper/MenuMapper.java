package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> selectMenuByUserId(int userId);
}

package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.BookUser;
import com.softlab.okr.model.vo.BookUserVO;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-12-13
 */
@Repository
public interface BookUserMapper extends BaseMapper<BookUser> {

    Page<BookUserVO> selectBookUserVO(Page<BookUser> page);

}

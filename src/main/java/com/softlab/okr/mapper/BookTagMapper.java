package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.BookTag;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-23
 */
@Repository
public interface BookTagMapper extends BaseMapper<BookTag> {

  int insertBookTag(int bookId, List<Integer> list) throws DataAccessException;

}

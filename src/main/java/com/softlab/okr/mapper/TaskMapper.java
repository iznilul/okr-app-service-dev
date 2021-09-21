package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Task;
import java.util.Collection;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-22
 */
@Repository
public interface TaskMapper extends BaseMapper<Task> {

  Integer insertBatch(Collection<Task> list);
}

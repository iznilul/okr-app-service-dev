package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.TagDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface TagMapper extends BaseMapper<Tag> {

  Page<Tag> selectTagListByCond(@Param("page") Page<Tag> page, @Param("dto") TagDTO dto)
      throws DataAccessException;
}

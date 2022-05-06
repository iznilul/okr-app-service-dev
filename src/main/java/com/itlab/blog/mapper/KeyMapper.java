package com.itlab.blog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.entity.Key;
import com.itlab.blog.model.vo.KeyVO;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyMapper extends BaseMapper<Key> {

  Page<KeyVO> selectKeyList(Page<Key> page);
}

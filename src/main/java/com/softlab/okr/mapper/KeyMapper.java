package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.Key;
import com.softlab.okr.model.vo.KeyVO;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyMapper extends BaseMapper<Key> {

  Page<KeyVO> selectKeyList(Page<Key> page);
}

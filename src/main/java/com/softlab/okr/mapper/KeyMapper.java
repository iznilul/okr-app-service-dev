package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.softlab.okr.entity.Key;
import com.softlab.okr.model.vo.KeyVO;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyMapper extends BaseMapper<Key> {

  List<KeyVO> selectKey();
}

package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.mapper.CsdnSpiderMapper;
import com.softlab.okr.model.entity.CsdnSpider;
import com.softlab.okr.service.CsdnService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-04 15:09
 **/
@Service
public class CsdnServiceImpl implements CsdnService {

  @Autowired
  private CsdnSpiderMapper csdnSpiderMapper;

  @Override
  public List<CsdnSpider> list() {
    return csdnSpiderMapper.selectList();
  }
}

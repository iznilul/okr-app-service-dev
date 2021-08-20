package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.mapper.SwitchMapper;
import com.softlab.okr.model.entity.Switch;
import com.softlab.okr.service.SwitchService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 14:57
 **/
@Service
public class SwitchServiceImpl implements SwitchService {

  @Autowired
  SwitchMapper switchMapper;

  @Override
  public List<Switch> getList() {
    return switchMapper.selectList();
  }

  @Override
  public int modifyStatus(String name) {
    return switchMapper.updateStatus(name);
  }

  @Override
  public Byte getStatus(String name) {
    return switchMapper.selectStatus(name);
  }

  @Override
  public int removeByName(String name) {
    return switchMapper.deleteByName(name);
  }

  @Override
  public int saveSwitch(String name) {
    return switchMapper.insertSwitch(name);
  }

}

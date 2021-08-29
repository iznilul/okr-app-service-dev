package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.convert.impl.LoginLogConvert;
import com.softlab.okr.mapper.LoginLogMapper;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.model.entity.LoginLog;
import com.softlab.okr.model.vo.LoginLogVO;
import com.softlab.okr.service.LoginLogService;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements LoginLogService {

  @Autowired
  LoginLogMapper loginLogMapper;

  @Autowired
  LoginLogConvert loginLogConvert;

  private static final DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

  @Override
  public int saveLog(String ip, String username, long duration) {
    return loginLogMapper.insertLog(ip, username, duration);
  }

  @Override
  public List<LoginLogVO> list() {
    List<LoginLog> loginLogList = loginLogMapper.selectList();
    return this.filter(loginLogList);
  }

  @Override
  public PageInfo<LoginLogVO> getByCond(LoginLogDTO loginLogDTO, Timestamp beginTime,
      Timestamp endTime) {
    PageHelper.startPage(loginLogDTO.getIndex(), loginLogDTO.getPageSize());
    List<LoginLog> loginLogList = loginLogMapper
        .selectByCond(loginLogDTO.getUsername(), beginTime, endTime);
    List<LoginLogVO> list = this.filter(loginLogList);
    return new PageInfo<>(list);
  }

  private List<LoginLogVO> filter(List<LoginLog> loginLogList) {
    List<LoginLogVO> list = new LinkedList<>();
    loginLogList.forEach(loginLog -> {
      LoginLogVO loginLogVO = loginLogConvert.convertVO(loginLog);
      loginLogVO.setTime(sdf.format(loginLog.getTime()));
      list.add(loginLogVO);
    });
    return list;
  }
}

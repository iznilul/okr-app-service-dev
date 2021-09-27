package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.LoginLog;
import com.softlab.okr.model.dto.LoginLogDTO;

public interface ILoginLogService extends IService<LoginLog> {

  Page<LoginLog> getByCond(LoginLogDTO dto);

  int saveLog(String ip, String path, String username, long duration);
}

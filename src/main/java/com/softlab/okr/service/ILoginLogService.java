package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.LoginLog;
import com.softlab.okr.model.dto.LoginLogDTO;
import com.softlab.okr.utils.Result;

public interface ILoginLogService extends IService<LoginLog> {

  Result getByCond(LoginLogDTO dto);

  Integer saveRecord(LoginLog loginLog);
}

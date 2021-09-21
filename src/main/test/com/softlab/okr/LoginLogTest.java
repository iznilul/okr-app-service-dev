package com.softlab.okr;

import com.softlab.okr.service.ILoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 19:38
 **/
@SpringBootTest
public class LoginLogTest {

  @Autowired
  ILoginLogService loginLogService;

  //@Test
  //public void saveLoginLog() {
  //  System.out.println(loginLogService.saveLog("192.168.1.1", "/api/common/log", "admin", 12));
  //}

}

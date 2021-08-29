package com.softlab.okr;

import com.softlab.okr.service.LoginLogService;
import org.junit.jupiter.api.Test;
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
  LoginLogService loginLogService;

  @Test
  public void saveLoginLog() {
    System.out.println(loginLogService.saveLog("192.168.1.1", "admin", 12));
  }

}

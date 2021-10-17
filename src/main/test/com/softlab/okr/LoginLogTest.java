package com.softlab.okr;

import com.softlab.okr.service.ISysRecordService;
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
  ISysRecordService sysRecordService;

  //@Test
  //public void saveLoginLog() {
  //  System.out.println(sysRecordService.saveLog("192.168.1.1", "/api/common/log", "admin", 12));
  //}

}

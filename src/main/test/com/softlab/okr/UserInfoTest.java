package com.softlab.okr;

import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-01 04:20
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserInfoTest {

  @Autowired
  private IUserInfoService userInfoService;

  @Autowired
  private IUserEntityService userEntityService;

  @Test
  public void test() {
    //UserInfo userInfo = userInfoService.getOne(new QueryWrapper<UserInfo>()
    //    .eq("username", "admin"));
    //System.out.println(userInfo);
    List<UserInfo> list = userInfoService.list();
  }
}

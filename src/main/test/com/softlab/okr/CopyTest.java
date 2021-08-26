package com.softlab.okr;

import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-26 15:53
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class CopyTest {

  @Test
  public void copySignVo() {
    SignUpVO signUpVO = new SignUpVO();
    SignUp signUp = new SignUp("1", "1", "1", "1", "1", "1", 1, "1");
    BeanUtils.copyProperties(signUp, signUpVO);
    System.out.println(signUpVO.toString());
  }
}

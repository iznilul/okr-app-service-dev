package com.softlab.okr;

import com.softlab.okr.dao.TagMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 18:39
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class TagTest {

  @Autowired
  TagMapper tagMapper;

  @Test
  public void test() {
  }
}

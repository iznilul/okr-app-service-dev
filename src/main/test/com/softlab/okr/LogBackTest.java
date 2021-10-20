package com.softlab.okr;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-21 01:21
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class LogBackTest {

  @Test
  public void test() {
    long start = System.currentTimeMillis();
    for (int i = 0; i < 10; i++) {
      long singleStart = System.currentTimeMillis();
      for (int y = 0; y < 1000; y++) {
        log.info("this is info message");
      }
      System.out.print(System.currentTimeMillis() - singleStart + " ");
    }
    System.out.println("\n spend time: " + (System.currentTimeMillis() - start));
  }
}

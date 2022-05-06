package com.itlab.blog.job;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * @program:
 * @description: 监听Schedule任务
 * @author: lulinzi
 * @create: 2021-08-24 15:54
 **/
@Component
public class ScheduleJobInitListener implements CommandLineRunner {

  @Autowired
  private ScheduleJobService jobService;

  @Override
  public void run(String... strings) throws Exception {
    //jobService.startJob();
  }
}

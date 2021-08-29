package com.softlab.okr.job;

import com.softlab.okr.annotation.TaskInfo;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * @program:
 * @description:
 * @author: lulinzi
 * @create: 2021-08-24 16:15
 **/
@TaskInfo(taskId = "T1", name = "测试任务1", function = "测试用的,输出当前时间")
public class testTask1 implements Job {

  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    LocalDateTime now = LocalDateTime.now();
    System.out.println("定时任务开始" + now.format(DateTimeFormatter.ofPattern("HH:mm:ss")));
  }
}

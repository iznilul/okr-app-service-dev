package com.softlab.okr.job;

import com.softlab.okr.annotation.TaskInfo;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * @program:
 * @description:
 * @author: lulinzi
 * @create: 2021-08-24 16:15
 **/

@TaskInfo(taskId = "T3", name = "三号测试任务", function = "测试用的,输出数字")
public class testTask3 implements Job {

  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    System.out.println("114514");
  }
}

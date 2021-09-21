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
@TaskInfo(taskId = "T2", name = "二号测试任务", function = "测试用的,输出名字")
public class testTask2 implements Job {

  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    System.out.println("我是任务二");
  }
}

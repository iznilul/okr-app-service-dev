package com.softlab.okr.job;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.softlab.okr.entity.TaskTrigger;
import com.softlab.okr.mapper.TaskMapper;
import com.softlab.okr.mapper.TaskTriggerMapper;
import java.util.List;
import java.util.Set;
import lombok.extern.log4j.Log4j2;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerConfigException;
import org.quartz.SchedulerException;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Program:
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-24 15:46
 **/

@Component
@Log4j2
public class ScheduleJobService {

  @Autowired
  private TaskTriggerMapper taskTriggerMapper;

  @Autowired
  private TaskMapper taskMapper;

  @Autowired
  private Scheduler scheduler;

  /**
   * @Description: 程序开始加载任务
   * @Param: []
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void startJob() {
    List<TaskTrigger> taskTriggerEntities = taskTriggerMapper
        .selectList(new QueryWrapper<TaskTrigger>().eq("status", 1));
    if (taskTriggerEntities == null || taskTriggerEntities.size() == 0) {
      log.error("定时任务加载数据为空");
      return;
    }
    for (TaskTrigger taskTrigger : taskTriggerEntities) {
      CronTrigger cronTrigger = null;
      JobDetail jobDetail = null;
      try {
        cronTrigger = getCronTrigger(taskTrigger);
        jobDetail = getJobDetail(taskTrigger);
        scheduler.scheduleJob(jobDetail, cronTrigger);
        log.info("编号：{}定时任务加载成功", taskTrigger.getTaskId());
      } catch (Exception e) {
        log.error("编号：{}定时任务加载失败", taskTrigger.getTaskId());
      }

    }
    try {
      scheduler.start();
    } catch (SchedulerException e) {
      log.error("定时任务启动失败", e);
    }
  }

  /**
   * @Description: 获取所有运行中的定时任务
   * @Param: []
   * @return: java.util.Set<org.quartz.JobKey>
   * @Author: lulinzi
   * @Date: 2021/8/27
   */
  public Set<JobKey> getJobs() throws SchedulerException {
    return scheduler.getJobKeys(GroupMatcher.anyGroup());
  }

  /**
   * @Description: 添加定时任务
   * @Param: [taskTrigger]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void addTaskTrigger(TaskTrigger taskTrigger) throws SchedulerConfigException {
    taskTriggerMapper.insert(taskTrigger);
    if (taskTrigger.getStatus() == 1) {
      loadJob(taskTrigger.getTaskId());
    }
  }

  /**
   * @Description: 删除定时任务
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void removeTaskTrigger(String taskId) throws SchedulerException {
    unloadJob(taskId);
    taskTriggerMapper.deleteById(taskId);
  }

  /**
   * @Description: 更新定时任务
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void modifyTaskTrigger(TaskTrigger taskTrigger) throws SchedulerException {
    unloadJob(taskTrigger.getTaskId());
    taskTriggerMapper
        .updateById(taskTrigger);
    if (taskTrigger.getStatus() == 1) {
      loadJob(taskTrigger.getTaskId());
    }
  }

  /**
   * @Description: 调度器停止任务
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void stopJob(String taskId) throws SchedulerException {
    scheduler.pauseJob(JobKey.jobKey(taskId));
  }

  /**
   * @Description: 调度器恢复任务
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void resumeJob(String taskId) throws SchedulerException {
    scheduler.resumeJob(JobKey.jobKey(taskId));
  }

  /**
   * @Description: 将数据库里新的job添加到scheduler进行调度
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void loadJob(String taskId) throws SchedulerConfigException {
    TaskTrigger taskTrigger = taskTriggerMapper
        .selectOne(new QueryWrapper<TaskTrigger>().eq("task_id", taskId).eq("status", 1));
    if (taskTrigger == null) {
      throw new SchedulerConfigException("未找到相关Job配置");
    }
    try {
      JobDetail jobDetail = getJobDetail(taskTrigger);
      CronTrigger cronTrigger = getCronTrigger(taskTrigger);
      scheduler.scheduleJob(jobDetail, cronTrigger);
    } catch (Exception e) {
      log.error("加载定时任务异常", e);
      throw new SchedulerConfigException("加载定时任务异常", e);
    }
  }

  /**
   * @Description: 从调度器卸载任务
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void unloadJob(String taskId) throws SchedulerException {
    // 停止触发器
    scheduler.pauseTrigger(TriggerKey.triggerKey(taskId));
    // 卸载定时任务
    scheduler.unscheduleJob(TriggerKey.triggerKey(taskId));
    // 删除原来的job
    scheduler.deleteJob(JobKey.jobKey(taskId));
  }

  /**
   * @Description: 这个方法是当运行中的任务在数据库中更新，重新从数据库加载到调度器用
   * @Param: [taskId]
   * @return: void
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  public void reloadJob(String taskId) throws Exception {
    TaskTrigger taskTrigger = taskTriggerMapper
        .selectOne(new QueryWrapper<TaskTrigger>().eq("task_id", taskId).eq("status", 1));

    String jobCode = taskTrigger.getTaskId();
    // 获取以前的触发器
    TriggerKey triggerKey = TriggerKey.triggerKey(jobCode);
    // 停止触发器
    scheduler.pauseTrigger(triggerKey);
    // 卸载定时任务
    scheduler.unscheduleJob(triggerKey);
    // 删除原来的job
    scheduler.deleteJob(JobKey.jobKey(jobCode));

    JobDetail jobDetail = getJobDetail(taskTrigger);
    CronTrigger cronTrigger = getCronTrigger(taskTrigger);
    // 重新加载job
    scheduler.scheduleJob(jobDetail, cronTrigger);
  }

  /**
   * @Description: 组装jobDetail
   * @Param: [taskTrigger]
   * @return: org.quartz.JobDetail
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  private JobDetail getJobDetail(TaskTrigger taskTrigger) throws ClassNotFoundException {
    JobDetail jobDetail = null;
    //反射实例化job类
    String className = taskMapper.selectById(taskTrigger.getTaskId()).getClassName();
    Class<? extends Job> aClass = Class.forName(className).asSubclass(Job.class);

    jobDetail = JobBuilder.newJob()
        .withIdentity(JobKey.jobKey(taskTrigger.getTaskId()))
        .withDescription(taskTrigger.getDescription())
        .ofType(aClass).build();
    return jobDetail;
  }

  /**
   * @Description: 组装trigger
   * @Param: [taskTrigger]
   * @return: org.quartz.CronTrigger
   * @Author: lulinzi
   * @Date: 2021/8/25
   */
  private CronTrigger getCronTrigger(TaskTrigger taskTrigger) {
    CronTrigger cronTrigger = null;
    CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder
        .cronSchedule(taskTrigger.getCron());
    cronTrigger = TriggerBuilder.newTrigger()
        .withIdentity(TriggerKey.triggerKey(taskTrigger.getTaskId()))
        .withSchedule(cronScheduleBuilder)
        .build();
    return cronTrigger;
  }
}

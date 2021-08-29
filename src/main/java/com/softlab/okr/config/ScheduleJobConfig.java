package com.softlab.okr.config;

import java.util.concurrent.Executor;
import javax.annotation.Resource;
import org.quartz.Scheduler;
import org.quartz.spi.JobFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 * @program:
 * @description:
 * @author: lulinzi
 * @create: 2021-08-24 15:44
 **/
@Configuration
public class ScheduleJobConfig {

  @Resource(name = "taskExecutor")
  private Executor taskExecutor;

  @Bean("schedulerFactoryBean")
  public SchedulerFactoryBean createFactoryBean(JobFactory jobFactory) {
    SchedulerFactoryBean factoryBean = new SchedulerFactoryBean();
    factoryBean.setJobFactory(jobFactory);
    factoryBean.setTaskExecutor(taskExecutor);
    factoryBean.setOverwriteExistingJobs(true);
    return factoryBean;
  }

  //通过这个类对定时任务进行操作
  @Bean
  public Scheduler scheduler(@Qualifier("schedulerFactoryBean") SchedulerFactoryBean factoryBean) {
    return factoryBean.getScheduler();
  }
}

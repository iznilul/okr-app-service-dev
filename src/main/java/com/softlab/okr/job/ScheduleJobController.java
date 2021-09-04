package com.softlab.okr.job;


import com.softlab.okr.model.dto.TaskTriggerDTO;
import com.softlab.okr.model.entity.TaskTrigger;
import java.util.Set;
import javax.validation.constraints.NotBlank;
import org.quartz.JobKey;
import org.quartz.SchedulerConfigException;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-08-24
 */


@RestController
@RequestMapping("/job")
@Validated
public class ScheduleJobController {

  @Autowired
  private ScheduleJobService jobService;

  @GetMapping("get")
  public Set<JobKey> getJobs() {
    try {
      return jobService.getJobs();
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }
    return null;
  }

  @PostMapping("add")
  public String addTaskTrigger(@RequestBody @Validated TaskTriggerDTO taskTriggerDTO) {
    TaskTrigger taskTrigger = new TaskTrigger(null, taskTriggerDTO.getTaskId(),
        taskTriggerDTO.getCron(),
        taskTriggerDTO.getDescription(),
        taskTriggerDTO.getStatus());
    try {
      jobService.addTaskTrigger(taskTrigger);
    } catch (SchedulerConfigException e) {
      return "添加定时任务失败";
    }
    return "成功";
  }

  @PostMapping("modify")
  public String modifyTaskTrigger(@RequestBody @Validated TaskTriggerDTO taskTriggerDTO) {
    TaskTrigger taskTrigger = new TaskTrigger(null, taskTriggerDTO.getTaskId(),
        taskTriggerDTO.getCron(),
        taskTriggerDTO.getDescription(),
        taskTriggerDTO.getStatus());
    try {
      jobService.modifyTaskTrigger(taskTrigger);
    } catch (SchedulerException e) {
      return "更新定时任务失败";
    }
    return "成功";
  }

  @GetMapping("remove")
  public String removeTaskTrigger(@RequestParam("taskId") @NotBlank String taskId) {
    try {
      jobService.removeTaskTrigger(taskId);
    } catch (SchedulerException e) {
      return "删除定时任务失败";
    }
    return "成功";
  }

  @GetMapping("resume")
  public String resumeJob(@RequestParam("taskId") @NotBlank String taskId) {
    try {
      jobService.resumeJob(taskId);
    } catch (SchedulerException e) {
      return "恢复定时任务失败";
    }
    return "成功";
  }

  @GetMapping("stop")
  public String stopJob(@RequestParam("taskId") @NotBlank String taskId) {
    try {
      jobService.stopJob(taskId);
    } catch (SchedulerException e) {
      return "暂停定时任务失败";
    }
    return "成功";
  }

  @GetMapping("load")
  public String loadJob(@RequestParam("taskId") @NotBlank String taskId) {
    try {
      jobService.loadJob(taskId);
    } catch (SchedulerConfigException e) {
      return "导入定时任务失败";
    }
    return "成功";
  }

  @GetMapping("unload")
  public String unloadJob(@RequestParam("taskId") @NotBlank String taskId) {
    try {
      jobService.unloadJob(taskId);
    } catch (SchedulerException e) {
      return "卸载定时任务失败";
    }
    return "成功";
  }

  @GetMapping("reload")
  public String reloadJob(@RequestParam("taskId") @NotBlank String taskId) throws Exception {
    try {
      jobService.reloadJob(taskId);
    } catch (SchedulerException e) {
      return "重载定时任务失败";
    }
    return "成功";
  }


}

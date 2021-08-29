package com.softlab.okr.model.dto;

import javax.validation.constraints.NotBlank;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

/**
 * @Program: qax-manager-platform
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-25 11:34
 **/

@Data
public class TaskConfigDTO {

  @NotBlank(message = "任务id不能为空")
  private String taskId;

  @NotBlank(message = "表达式不能为空")
  private String cron;

  @NotBlank(message = "任务描述不能为空")
  private String description;

  @Range(min = 0, max = 1, message = "参数需为0或1")
  private Integer status;

}

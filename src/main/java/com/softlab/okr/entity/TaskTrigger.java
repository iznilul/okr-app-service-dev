package com.softlab.okr.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-08-24
 */
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class TaskTrigger {

  private static final long serialVersionUID = 1L;

  private Integer triggerId;
  /**
   * 任务id
   */
  private String taskId;

  /**
   * cron表达式
   */
  private String cron;

  /**
   * 描述
   */
  private String description;

  /**
   * 定时任务状态 0 停用,1启用
   */
  private Integer status;


}

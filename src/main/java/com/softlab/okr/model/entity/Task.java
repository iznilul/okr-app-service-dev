package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-08-25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Task {

  private static final long serialVersionUID = 1L;

  /**
   * 任务id
   */
  private String taskId;

  /**
   * 任务名
   */
  private String name;

  /**
   * 任务类
   */
  private String className;

  /**
   * 任务功能
   */
  private String function;


}

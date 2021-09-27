package com.softlab.okr.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class Route extends BaseEntity {

  private static final long serialVersionUID = 1L;

  /**
   * 主键
   */
  private Integer routeId;

  /**
   * 路径
   */
  private String path;

  /**
   * 名称
   */
  private String name;

  /**
   * 路径状态 0关闭 1开启
   */
  private Boolean status;


}

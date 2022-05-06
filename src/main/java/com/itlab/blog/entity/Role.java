package com.itlab.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 20:05
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {

  private static final long serialVersionUID = 1L;

  /**
   * 主键
   */
  private Integer roleId;

  /**
   * 角色
   */
  private String role;

  /**
   * 角色名
   */
  private String name;
}

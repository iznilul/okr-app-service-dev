package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 20:05
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {

  private static final long serialVersionUID = 1L;

  @TableId(value = "role_id", type = IdType.AUTO)
  private Integer roleId;
  private String name;
}

package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 14:34
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Switch {

  private Integer switchId;
  private String name;
  private Integer status;
}

package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-18 23:25
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tag {

  private Integer tagId;
  private String name;
  private Integer order;
}

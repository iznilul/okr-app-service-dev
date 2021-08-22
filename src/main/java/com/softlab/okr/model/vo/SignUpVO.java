package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 11:30
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUpVO {

  private Integer status;
  private String comment;
}

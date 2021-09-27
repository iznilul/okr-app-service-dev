package com.softlab.okr.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 14:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginLog {

  private Integer loginId;
  private String ip;
  private String path;
  private String username;
  private String time;
  private long duration;
}

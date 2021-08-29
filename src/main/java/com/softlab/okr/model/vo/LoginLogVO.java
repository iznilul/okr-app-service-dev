package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 15:09
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginLogVO {

  private String ip;
  private String username;
  private String time;
  private long duration;
}

package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class SysRecord {

  private static final long serialVersionUID = 1L;

  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  private String ip;
  private String path;
  private String username;
  private String time;
  private long duration;
}

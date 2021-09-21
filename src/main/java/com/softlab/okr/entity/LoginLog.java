package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 14:47
 **/
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class LoginLog {

  private static final long serialVersionUID = 1L;
  /**
   * 主键
   */
  @TableId(value = "login_id", type = IdType.AUTO)
  private Integer loginId;

  private String ip;
  private String path;
  private String username;

  @TableField(fill = FieldFill.INSERT)
  private Date time;
  private long duration;
}

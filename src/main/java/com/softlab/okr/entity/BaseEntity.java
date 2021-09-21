package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import java.util.Date;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 基础实体类，所有实体对象集成此类
 *
 * @author RudeCrab
 */

@Data
@Accessors(chain = true)
public abstract class BaseEntity {

  @TableField(fill = FieldFill.INSERT)
  public Date createTime;

  @TableField(fill = FieldFill.INSERT_UPDATE)
  public Date updateTime;
}

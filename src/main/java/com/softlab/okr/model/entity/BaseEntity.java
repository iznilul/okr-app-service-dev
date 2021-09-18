package com.softlab.okr.model.entity;

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

  //@TableField(fill = FieldFill.INSERT)
  public Date createTime;

  //@TableField(fill = FieldFill.INSERT_UPDATE)
  public Date updateTime;
}

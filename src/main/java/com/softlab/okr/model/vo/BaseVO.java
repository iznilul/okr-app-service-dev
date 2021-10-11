package com.softlab.okr.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 基础实体类，所有实体对象集成此类
 *
 * @author RudeCrab
 */

@Data
@Accessors(chain = true)
public abstract class BaseVO {

  public String createTime;

  public String updateTime;
}

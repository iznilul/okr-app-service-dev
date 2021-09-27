package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 资源
 *
 * @author RudeCrab
 */
@Data
@Accessors(chain = true)
@AllArgsConstructor
@NoArgsConstructor
public class Resource {

  @TableId(value = "resource_id", type = IdType.AUTO)
  private Integer resourceId;
  /**
   * 路径
   */
  private String method;
  private String path;
  /**
   * 名称
   */
  private String name;
  private Integer status;
}

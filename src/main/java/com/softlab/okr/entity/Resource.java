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

  private static final long serialVersionUID = 1L;

  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  /**
   * 名称
   */
  private String name;
    /**
     * 方法
   */
  private String method;
    /**
     * 路径
     */
    private String path;

    /**
     * 角色
     */
    private String role;
    /**
   * 状态
   */
  private Integer status;
}

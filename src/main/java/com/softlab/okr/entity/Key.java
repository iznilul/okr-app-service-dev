package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-29 22:31
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Key {

  private static final long serialVersionUID = 1L;

  @TableId(value = "key_id", type = IdType.AUTO)
  private Integer keyId;
  private String keyName;
}
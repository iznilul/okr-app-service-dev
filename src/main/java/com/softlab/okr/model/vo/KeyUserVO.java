package com.softlab.okr.model.vo;

import com.softlab.okr.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-27 01:12
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeyUserVO extends BaseEntity {

  private Integer id;
  private String keyName;
  private String name;
  private Integer status;
  private String statusName;
}

package com.softlab.okr.model.dto;

import javax.validation.constraints.Pattern;
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
public class KeyDTO {

  private Integer keyId;
  private String keyName;
  @Pattern(regexp = "^(未借走|已借走|已丢失)$", message = "请输入正确的格式")
  private String statusName;
}

package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("RecourceDTO 资源接口传输类")
public class ResourceDTO {

  @ApiModelProperty(value = "当前页", required = true, example = "1")
  private Integer index;
  
  @ApiModelProperty(value = "页大小", required = true, example = "8")
  private Integer pageSize;

  public Integer getIndex() {
    return index = index == null ? 1 : index;
  }

  public Integer getPageSize() {
    return pageSize = pageSize == null ? 5 : pageSize;
  }
}

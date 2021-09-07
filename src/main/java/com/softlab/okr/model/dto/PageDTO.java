package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 16:31
 **/
@Data
public class PageDTO {

  @ApiModelProperty(value = "当前页", required = true, example = "1")
  private Integer index;

  @ApiModelProperty(value = "一页容量", required = true, example = "10")
  private Integer pageSize;

  public Integer getIndex() {
    return index = index == null ? 1 : index;
  }

  public Integer getPageSize() {
    return pageSize = pageSize == null ? 10 : pageSize;
  }
}

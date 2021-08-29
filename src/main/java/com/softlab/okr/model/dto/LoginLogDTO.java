package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 14:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("LoginLogDto 登录日志传输类")
public class LoginLogDTO {

  @ApiModelProperty(value = "用户名", required = true, example = "admin")
  private String username;

  @ApiModelProperty(value = "起始时间", required = true, example = "")
  private String beginTime;

  @ApiModelProperty(value = "结束时间", required = true, example = "")
  private String endTime;


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

package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 14:47
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("LoginLogDto 登录日志传输类")
public class LoginLogDTO extends PageDTO {

  @ApiModelProperty(value = "用户名", required = true, example = "admin")
  private String username;

  @ApiModelProperty(value = "起始时间", required = true, example = "")
  private String beginTime;

  @ApiModelProperty(value = "结束时间", required = true, example = "")
  private String endTime;
}

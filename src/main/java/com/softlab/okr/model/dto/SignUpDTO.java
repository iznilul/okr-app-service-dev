package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 11:34
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("signUpDTO 用户报名传输类")
public class SignUpDTO {

  @ApiModelProperty(value = "学号", required = true, example = "123")
  private Integer id;

  @ApiModelProperty(value = "姓名", required = true, example = "臭臭")
  private String name;

  @ApiModelProperty(value = "性别", required = true, example = "男")
  private String gender;

  @ApiModelProperty(value = "qq号", required = true, example = "12345")
  private String qq;

  @ApiModelProperty(value = "专业班级", required = true, example = "挖掘机1802")
  private String major;

  @ApiModelProperty(value = "录取状态", required = true, example = "0")
  private Integer status;

  @NotNull(message = "当前页不能为空")
  @ApiModelProperty(value = "当前页", required = true, example = "1")
  private Integer index;

  @NotNull(message = "页大小不能为空")
  @ApiModelProperty(value = "页大小", required = true, example = "8")
  private Integer pageSize;

  public Integer getIndex() {
    return index = index == null ? 1 : index;
  }

  public Integer getPageSize() {
    return pageSize = pageSize == null ? 5 : pageSize;
  }
}

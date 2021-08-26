package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import javax.validation.constraints.Pattern;
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
@ApiModel("TagDto 标签接口传输类")
public class TagDTO {

  @ApiModelProperty(value = "标签名", required = true, example = "java")
  private String name;

  @Pattern(regexp = "^(DESC|ASC)$", message = "规则需为降序或升序")
  @ApiModelProperty(value = "排序规则", required = true, example = "DESC")
  private String orderRule;

  @ApiModelProperty(value = "当前页", required = true, example = "1")
  private Integer index;

  @ApiModelProperty(value = "页大小", required = true, example = "8")
  private Integer pageSize;

  public String getOrderRule() {
    return orderRule = orderRule == null ? "DESC" : orderRule;
  }

  public Integer getIndex() {
    return index = index == null ? 1 : index;
  }

  public Integer getPageSize() {
    return pageSize = pageSize == null ? 5 : pageSize;
  }

}

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
@ApiModel("BookDto 书记接口传输类")
public class BookDTO {

  @ApiModelProperty(value = "书名", required = true, example = "java从入门到跑路")
  private String bookName;

  @ApiModelProperty(value = "出版社", required = true, example = "机械工业出版社")
  private String publisher;

  @Pattern(regexp = "^$|^(空闲|借阅|丢失)$", message = "书籍状态需要满足规则")
  @ApiModelProperty(value = "状态", required = true, example = "DESC")
  private String status;

  @ApiModelProperty(value = "用户Id", required = true, example = "王二狗")
  private String userName;

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

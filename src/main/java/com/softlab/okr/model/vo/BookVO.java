package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookVO {

  private Integer bookId;

  private String bookName;

  private String img;

  private String publisher;

  private Integer price;

  private String userName;

  @Pattern(regexp = "^$|^(空闲|借阅|丢失)$", message = "书籍状态需要满足规则")
  private String status;

  private List<Integer> tagIdList;

  public String getStatus() {
    return status == null || status.equals("") ? "空闲" : status;
  }

}

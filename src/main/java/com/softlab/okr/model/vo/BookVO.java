package com.softlab.okr.model.vo;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

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

  @Range(min = 0, max = 2, message = "书籍状态需要满足规则")
  private Integer status;

  private String statusName;

  private List<Integer> tagIdList;

}

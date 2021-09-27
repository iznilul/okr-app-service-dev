package com.softlab.okr.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-18 23:21
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book extends BaseEntity {

  private Integer bookId;
  private String bookName;
  private String img;
  private String publisher;
  private Integer price;
  private Integer status;
  private Integer userId;

}

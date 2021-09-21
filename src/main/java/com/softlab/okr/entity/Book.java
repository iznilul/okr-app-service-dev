package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-18 23:21
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Book extends BaseEntity {

  /**
   * 主键
   */
  @TableId(value = "book_id", type = IdType.AUTO)
  private Integer bookId;
  private String bookName;
  private String img;
  private String publisher;
  private Integer price;
  private Integer status;
  private Integer userId;

}

package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-18 23:21
 **/
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Book extends BaseEntity {

    private static final long serialVersionUID = 1L;
    @TableId(value = "book_id", type = IdType.AUTO)
    private Integer bookId;
    private String bookName;
    private String img;
    private String publisher;
    private Integer status;
}

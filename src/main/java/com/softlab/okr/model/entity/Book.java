package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

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
    private Integer BookId;
    private String name;
    private String img;
    private String publisher;
    private BigDecimal price;
    private Integer status;
    private Integer userId;
}

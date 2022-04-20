package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    private Integer userId;

    private Integer status;

    private String statusName;

    private List<String> tagList;

}

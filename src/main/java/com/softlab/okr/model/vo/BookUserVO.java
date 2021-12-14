package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-27 01:12
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookUserVO {

    private Long id;
    private String bookName;
    private String name;
    private Integer status;
    private String statusName;
    public String updateTime;
}

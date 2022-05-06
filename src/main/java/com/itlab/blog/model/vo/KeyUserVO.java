package com.itlab.blog.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-09-27 01:12
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeyUserVO {

    private Long id;
    private String keyName;
    private String name;
    private Integer status;
    private String statusName;
    public String updateTime;
}

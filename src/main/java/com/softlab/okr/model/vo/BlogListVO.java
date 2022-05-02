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
public class BlogListVO {

    private Integer blogId;

    private String title;

    private String name;

    private String statusName;

    private Integer status;

    private String updateTime;

    private List<String> tagList;

}

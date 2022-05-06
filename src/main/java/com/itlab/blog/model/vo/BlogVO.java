package com.itlab.blog.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogVO {

    private Integer blogId;

    private String title;

    private String content;

    private String comment;

    private Integer status;

    private String statusName;

    private String name;

    private String categoryName;

    private List<String> tagList;

}

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
public class BlogListVO {

    private Integer blogId;

    private String title;

    private Integer clickCount;

    private String username;

    private String name;

    private String statusName;

    private Integer status;

    private String publishName;

    private Integer publishIsOrNot;

    private String updateTime;

    private String category;

    private List<String> tagList;

}

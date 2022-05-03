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
public class BlogDetailVO {

    private Integer blogId;

    private String title;

    private String originalName;

    private String originUrl;

    private String statusName;

    private String publishName;

    private String comment;

    private String categoryName;

    private List<String> tagList;

}

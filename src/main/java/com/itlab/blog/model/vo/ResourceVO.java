package com.itlab.blog.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResourceVO {

    private String resourceId;

    private String path;

    private String name;

    private String roleName;

    private Integer status;

    private String statusName;

}

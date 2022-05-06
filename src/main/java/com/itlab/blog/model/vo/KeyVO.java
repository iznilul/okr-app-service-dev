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
public class KeyVO {

    private Long keyId;
    private String keyName;
    private Integer status;
    private String statusName;
    private Integer userId;
}

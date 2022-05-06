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
public class UserBlogVO {
    private String name;

    private Integer blogNumbers;

    private Integer notScored;

    private Integer failed;

    private Integer pass;

    private Integer good;

    private Integer excellent;

    private String lastSubmitTime;
}

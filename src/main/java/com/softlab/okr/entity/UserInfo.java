package com.softlab.okr.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-02 18:48
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserInfo extends BaseEntity {
    private Integer userId;
    private String username;
    private String name;
    private String avatar;
    private String major;
    private String qq;
    private String phone;
    private String weixin;
    private String desc;
}

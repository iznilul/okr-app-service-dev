package com.softlab.okr.model;

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
public class User {
    private String role;
    private String account;
    private String password;
    private String userName;
    private String avatar;
    private String major;
    private String qq;
    private String phone;
    private String weixin;
    private String desc;
    private long createTime;
    private long updateTime;
}

package com.softlab.okr.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 15:23
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterBo {
    private String role;
    private String account;
    private String password;
    private long createTime;
    private long updateTime;
}

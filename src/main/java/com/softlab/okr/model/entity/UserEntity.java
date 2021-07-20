package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 17:04
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEntity {
    private Integer userId;
    private String username;
    private String password;
}

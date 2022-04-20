package com.softlab.okr.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 17:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserDTO {

    private String username;

    private String name;

    private String major;

    private String qq;

    private String phone;

    private String weixin;

    private String profile;
}

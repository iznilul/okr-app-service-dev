package com.softlab.okr.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author RudeCrab
 */
@Data
@Accessors(chain = true)
public class UserInfoVO {

    private Integer userId;
    private String username;
    private String name;
    private String avatar;
    private String major;
    private String qq;
    private String phone;
    private String weixin;
    private String profile;
    private Integer status;
    private String statusName;
}

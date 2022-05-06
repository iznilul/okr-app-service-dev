package com.itlab.blog.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author RudeCrab
 */
@Data
@Accessors(chain = true)
public class UserRoleVO {

    private String username;

    private String role;

    private String expireTime;

    private String statusName;
}

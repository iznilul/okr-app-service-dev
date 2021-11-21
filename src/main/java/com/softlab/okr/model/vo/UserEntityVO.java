package com.softlab.okr.model.vo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Set;

/**
 * @author RudeCrab
 */
@Data
@Accessors(chain = true)
public class UserEntityVO {
    /**
     * 主键
     */
    private Integer userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 登录认证token
     */
    private String token;
    /**
     * 当前用户的权限资源id集合
     */
    private Set<Integer> resourceIds;
}

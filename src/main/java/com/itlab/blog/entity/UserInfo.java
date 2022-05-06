package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-02 18:48
 **/

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class UserInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "user_id")
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
    @TableField(exist = false)
    private Integer roleId;
    @TableField(exist = false)
    private String role;
}

package com.itlab.blog.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDTO {

    @NotBlank(message = "账号不能为空")
    private String username;

    @Pattern(regexp = "^(管理员|普通用户)$", message = "请输入正确的格式")
    private String name;
}

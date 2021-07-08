package com.softlab.okr.dto.user;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("LoginDto 登录接口传输类")
public class LoginDto {
    @ApiModelProperty(value = "账号", required = true, example = "123")
    private String account;
    @ApiModelProperty(value = "密码", required = true, example = "202cb962ac59075b964b07152d234b70")
    private String password;
}

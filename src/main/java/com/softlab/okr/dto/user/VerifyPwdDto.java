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
 * @create: 2021-07-08 16:10
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("VerifyPwdDto 更新密码接口传输类")
public class VerifyPwdDto {
    @ApiModelProperty(value = "账号", required = true, example = "123")
    private String account;
    @ApiModelProperty(value = "旧密码", required = true, example = "202cb962ac59075b964b07152d234b70")
    private String oldPassword;
    @ApiModelProperty(value = "新密码", required = true, example = "202cb962ac59075b964b07152d234b70")
    private String newPassword;
}

package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("RegisterDto 注册接口传输类")
public class RegisterDTO {

    @NotBlank(message = "账号不能为空")
    @ApiModelProperty(value = "账号", required = true, example = "123")
    private String username;

    @Pattern(regexp = "^(管理员|普通用户)$", message = "角色需要为管理员或者普通用户")
    @ApiModelProperty(value = "角色", required = true, example = "管理员")
    private String name;
}

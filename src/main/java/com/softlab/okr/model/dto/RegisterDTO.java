package com.softlab.okr.model.dto;

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
@ApiModel("RegisterDto 注册接口传输类")
public class RegisterDTO {
    @ApiModelProperty(value = "账号", required = true, example = "123")
    private String username;
    @ApiModelProperty(value = "角色", required = true, example = "管理员")
    private String name;
}

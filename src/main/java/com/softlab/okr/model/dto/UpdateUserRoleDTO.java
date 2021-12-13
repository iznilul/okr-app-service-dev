package com.softlab.okr.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 17:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("用户权限更新传输类")
public class UpdateUserRoleDTO {

    @ApiModelProperty(value = "用户名", required = true, example = "admin")
    private String username;

    @ApiModelProperty(value = "状态名", required = true, example = "xxxx")
    private String statusName;

    @ApiModelProperty(value = "权限", required = true, example = "llz20161030")
    private String role;

    @ApiModelProperty(value = "过期时间", required = true, example = "只会crud的臭乐色")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    private Date expireTime;
}

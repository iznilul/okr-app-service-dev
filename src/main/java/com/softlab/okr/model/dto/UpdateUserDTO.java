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
 * @create: 2021-07-08 17:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("updateUserDto 用户信息更新传输类")
public class UpdateUserDTO {
    @ApiModelProperty(value = "用户名", required = true, example = "123")
    private String username;
    @ApiModelProperty(value = "真实姓名", required = true, example = "llz")
    private String name;
    @ApiModelProperty(value = "专业班级", required = false, example = "挖掘机1802")
    private String major;
    @ApiModelProperty(value = "qq号", required = false, example = "1773950094")
    private String qq;
    @ApiModelProperty(value = "电话", required = false, example = "xxxx")
    private String phone;
    @ApiModelProperty(value = "微信号", required = false, example = "llz20161030")
    private String weixin;
    @ApiModelProperty(value = "学习/研究方向", required = false, example = "只会crud的臭乐色")
    private String desc;
}

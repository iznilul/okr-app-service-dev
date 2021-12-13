package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 11:34
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("signUpDTO 查询报名传输类")
public class SignUpDTO extends PageDTO {

    @ApiModelProperty(value = "学号", required = true, example = "123")
    private String studentId;

    @ApiModelProperty(value = "姓名", required = true, example = "臭臭")
    private String name;

    @ApiModelProperty(value = "专业班级", required = true, example = "挖掘机1802")
    private String major;
}

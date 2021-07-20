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
 * @create: 2021-07-08 13:51
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("SelectUesrDto 选择用户接口传输类")
public class SelectUserDTO {

    @ApiModelProperty(value = "用户名", required = true, example = "123")
    private String username;
    @ApiModelProperty(value = "姓名", required = true, example = "llz")
    private String name;
    @ApiModelProperty(value = "专业班级", required = true, example = "1802")
    private String major;
    @ApiModelProperty(value = "当前页", required = true, example = "1")
    private Integer index;

    public Integer getIndex() {
        return index = index == null ? 1 : index;
    }
}

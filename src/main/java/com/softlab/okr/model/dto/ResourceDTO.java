package com.softlab.okr.model.dto;

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
public class ResourceDTO extends PageDTO {

    @ApiModelProperty(value = "标签名", required = true, example = "java")
    private String name;

}

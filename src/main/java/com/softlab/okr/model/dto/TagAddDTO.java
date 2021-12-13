package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("TagDto 标签传输类")
public class TagAddDTO {
    @NotBlank(message = "名称不能为空")
    private String name;
    @NotNull(message = "排序权重不能为空")
    private Integer weight;
}

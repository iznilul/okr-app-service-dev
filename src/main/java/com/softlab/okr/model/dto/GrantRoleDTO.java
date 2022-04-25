package com.softlab.okr.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-11-23 01:11
 **/
@Data
public class GrantRoleDTO {

    @NotNull
    private Integer userId;

    //正则表达式匹配需要跟枚举类里的一样
    @Pattern(regexp = "^(超级管理员|管理员|普通用户)$",message = "请输入正确的格式")
    private String roleMessage;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Shanghai")
    private Date date;

    private Boolean flag;
}

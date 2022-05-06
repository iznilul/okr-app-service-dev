package com.itlab.blog.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-09-27 01:12
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class KeyDTO {

    private Long keyId;
    private String keyName;
    @Pattern(regexp = "^(空闲|有人保管|已丢失)$", message = "请输入正确的格式")
    private String statusName;
}

package com.itlab.blog.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * @program: blog
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 11:34
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignUpChangeDTO {

    @NotBlank
    private String studentId;

    @NotBlank
    private String statusName;

    private String comment;
}

package com.softlab.okr.model.dto;

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
public class SignUpDTO extends PageDTO {

    private String studentId;

    private String name;

    private String major;
}

package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 11:30
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class SignUpVO {

    private Integer id;
    private String studentId;
    private String name;
    private String gender;
    private String qq;
    private String major;
    private String profile;
    private Integer status;
    private String statusName;
    private String comment;
}

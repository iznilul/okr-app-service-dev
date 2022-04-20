package com.softlab.okr.model.dto;

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
public class SelectUserDTO extends PageDTO {

    private String username;

    private String name;

    private String major;

}

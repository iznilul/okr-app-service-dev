package com.softlab.okr.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 17:16
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserRoleDTO {

    private String username;

    private String statusName;

    private String role;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    private Date expireTime;
}

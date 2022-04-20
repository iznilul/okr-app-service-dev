package com.softlab.okr.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 16:10
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ModifyPwdDTO {

    @NotBlank(message = "旧密码不能为空")
    private String oldPassword;

    @NotBlank(message = "新密码不能为空")
    private String newPassword;
}

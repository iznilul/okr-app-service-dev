package com.softlab.okr.exception;

import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 02:04
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApiException extends RuntimeException {

    private BaseCode baseCode;
}
package com.softlab.okr.model.exception;

import lombok.Data;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-17 17:07
 **/
@Data
public class BaseException extends RuntimeException {

    public BaseException() {
        super();
    }
}

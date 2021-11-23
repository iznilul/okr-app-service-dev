package com.softlab.okr.model.exception;

import com.softlab.okr.model.enums.BaseCode;
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

    public BaseException(BaseCode baseCode) {
        super(baseCode.message());
    }

    public BaseException(String message) {
        super(message);
    }
}

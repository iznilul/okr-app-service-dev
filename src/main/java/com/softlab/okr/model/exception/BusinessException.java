package com.softlab.okr.model.exception;

import com.softlab.okr.model.enums.BaseCode;
import lombok.Data;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 02:04
 **/
@Data
public class BusinessException extends BaseException {

    public BusinessException() {
        super();
    }

    public BusinessException(BaseCode baseCode) {
        super(baseCode);
    }

    public BusinessException(String message) {
        super(message);
    }
}
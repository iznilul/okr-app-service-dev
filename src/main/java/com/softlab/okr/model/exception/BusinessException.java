package com.softlab.okr.model.exception;

import com.softlab.okr.model.enums.BaseEnum;
import lombok.Data;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 02:04
 **/
@Data
public class BusinessException extends BaseException {
    private Integer code;
    private String message;

    public BusinessException() {
        super();
    }

    public BusinessException(BaseEnum baseEnum) {
        this.code = baseEnum.code();
        this.message = baseEnum.message();
    }

    public BusinessException(String message) {
        this.code = 400;
        this.message = message;
    }
}
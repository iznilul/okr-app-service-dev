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

    public BusinessException() {
        super();
    }

    public BusinessException(BaseEnum baseEnum) {
        super.setCode(baseEnum.code());
        this.setMessage(baseEnum.message());
    }

    public BusinessException(String message) {
        super.setCode(400);
        super.setMessage(message);
    }
}
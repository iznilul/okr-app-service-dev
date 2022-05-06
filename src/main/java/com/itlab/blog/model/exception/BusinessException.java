package com.itlab.blog.model.exception;

import com.itlab.blog.model.enums.BaseEnum;
import lombok.Data;

/**
 * @program: blog
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
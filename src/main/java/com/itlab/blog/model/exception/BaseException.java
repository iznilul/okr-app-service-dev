package com.itlab.blog.model.exception;

import lombok.Data;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-17 17:07
 **/
@Data
public class BaseException extends RuntimeException {

    private Integer code;
    private String message;

    public BaseException() {
        super();
    }
}

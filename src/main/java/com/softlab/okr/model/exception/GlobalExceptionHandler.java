package com.softlab.okr.model.exception;

import com.softlab.okr.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 01:56
 */
@ControllerAdvice
@Slf4j
@RestController
public class GlobalExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(Exception e) {
        log.error("业务内部错误" + e.toString());
        e.printStackTrace();
        return Result.failure(e.getMessage());
    }
}

package com.softlab.okr.model.exception;

import com.softlab.okr.model.enums.ReturnEnum;
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

    @ExceptionHandler(value = BusinessException.class)
    public Result BusinessExceptionHandler(BusinessException e) {
        log.error("请求失败");
        e.printStackTrace();
        return Result.failure(e);
    }

    @ExceptionHandler(value = Exception.class)
    public Result BusinessExceptionHandler(Exception e) {
        log.error("服务系统错误");
        e.printStackTrace();
        return Result.failure(ReturnEnum.ERROR);
    }
}

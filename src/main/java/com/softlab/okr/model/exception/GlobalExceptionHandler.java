package com.softlab.okr.model.exception;

import com.softlab.okr.model.enums.ReturnEnum;
import com.softlab.okr.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.ConstraintViolationException;

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

    @ExceptionHandler(value = BaseException.class)
    public Result BusinessExceptionHandler(BaseException e) {
        log.error("业务错误:" + e.toString());
        e.printStackTrace();
        return Result.failure(e);
    }

    //方法参数格式错误(RequestParam)
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public Result methodArgumentNotValidExceptionHandler(MethodArgumentNotValidException e) {
        log.error("参数格式错误:" + e.toString());
        e.printStackTrace();
        String message = e.getMessage();
        return Result.failure(message);
    }

    //post入参格式错误
    @ExceptionHandler(value = ConstraintViolationException.class)
    public Result ConstraintViolationExceptionHandler(ConstraintViolationException e) {
        log.error("参数格式错误:" + e.toString());
        e.printStackTrace();
        String message = e.getMessage();
        return Result.failure(message);
    }

    @ExceptionHandler(value = DataAccessException.class)
    public Result dataAccessExceptionHandler(DataAccessException e) {
        log.error("数据库持久层错误:" + e.toString());
        e.printStackTrace();
        return Result.failure(ReturnEnum.SQL_ERROR);
    }

    @ExceptionHandler(value = BusinessException.class)
    public Result BusinessExceptionHandler(BusinessException e) {
        log.error("业务错误:" + e.toString());
        e.printStackTrace();
        return Result.failure(e);
    }

    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(Exception e) {
        log.error("服务系统错误:" + e.toString());
        e.printStackTrace();
        return Result.failure(ReturnEnum.ERROR);
    }
}

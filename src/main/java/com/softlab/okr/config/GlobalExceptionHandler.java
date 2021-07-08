package com.softlab.okr.config;

import com.softlab.okr.Exception.BusinessException;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 01:56
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public Result exceptionHandler(HttpServletRequest httpServletRequest,
                                   Exception e) {
        log.error("服务错误: " + e.toString());
        log.error("定位: " + e.getStackTrace()[0].toString());
        return Result.failure(ResultCode.UNKNOWN_ERROR);
    }

    /**
     * 处理 BusinessException 异常
     *
     * @param httpServletRequest httpServletRequest
     * @param e                  异常
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = BusinessException.class)
    public Result businessExceptionHandler(
            HttpServletRequest httpServletRequest, BusinessException e) {
        log.error("业务异常 code:" + e.getResultCode().toString());
        //定位打印抛出错误的地方
        log.error("定位:" + e.getStackTrace()[0].toString());
        return Result.failure(e.getResultCode());
    }
}

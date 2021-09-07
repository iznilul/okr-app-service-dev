package com.softlab.okr.config;

import com.softlab.okr.exception.ApiException;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.enums.returnCode.ResultReturn;
import com.softlab.okr.utils.Result;
import io.jsonwebtoken.ExpiredJwtException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.exceptions.IbatisException;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 01:56
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

  /**
   * @Description:io异常处理类
   * @Param: [httpServletRequest, e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = IOException.class)
  public Result ioExceptionHandler(HttpServletRequest httpServletRequest,
      IOException e) {
    log.error("IO错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.IO_ERROR);
  }

  /**
   * @Description: 用户未找到异常
   * @Param: [httpServletRequest, e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = UsernameNotFoundException.class)
  public Result usernameNotFoundExceptionHandler(HttpServletRequest httpServletRequest,
      UsernameNotFoundException e) {
    log.error("用户错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.USER_LOGIN_ERROR);
  }

  /**
   * @Description: 参数异常
   * @Param: [httpServletRequest, e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/8/5
   */
  @ResponseBody
  @ExceptionHandler(value = IllegalArgumentException.class)
  public Result IllegalArgumentExceptionHandler(
      IllegalArgumentException e) {
    log.error("参数错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.PARAM_NOT_COMPLETE, e.getMessage());
  }

  /**
   * @Description: Token过期错误
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = ExpiredJwtException.class)
  public Result ExpiredJwtExceptionHandler(
      ExpiredJwtException e) {
    log.error("用户Token已过期:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.USER_TOKEN_EXPIRE);
  }

  /**
   * @Description:
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = IbatisException.class)
  public Result IbatisExceptionHandler(
      IbatisException e) {
    log.error("Mybatis持久化层错误:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.IBATIS_ERROR);
  }

  /**
   * @Description: 控制层接口异常
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = ApiException.class)
  public Result ApiExceptionHandler(
      ApiException e) {
    log.error("控制层接口异常 code:" + e.getBaseCode().toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(e.getBaseCode());
  }

  /**
   * @Description: 参数异常
   * @Param: [e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/8/22
   */
  @ResponseBody
  @ExceptionHandler(value = ConstraintViolationException.class)
  public Result ConstraintViolationExceptionHandler(
      ConstraintViolationException e) {
    log.error("参数异常:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    Set<ConstraintViolation<?>> cves = e.getConstraintViolations();
    StringBuilder errorMsg = new StringBuilder();
    cves.forEach(ex -> errorMsg.append(ex.getMessage()));
    return Result.failure(ResultReturn.PARAM_NOT_COMPLETE, errorMsg.toString());
  }

  /**
   * @Description: 参数实体异常
   * @Param: [e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/8/22
   */
  @ResponseBody
  @ExceptionHandler(value = MethodArgumentNotValidException.class)
  public Result MethodArgumentExceptionHandler(
      MethodArgumentNotValidException e) {
    log.error("参数实体异常:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    List<String> errorInformation = e.getBindingResult().getAllErrors()
        .stream()
        .map(ObjectError::getDefaultMessage)
        .collect(Collectors.toList());
    return Result.failure(ResultReturn.PARAM_NOT_COMPLETE, errorInformation);
  }


  /**
   * @Description: 参数实体异常
   * @Param: [e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/8/22
   */
  @ResponseBody
  @ExceptionHandler(value = BindException.class)
  public Result BindExceptionHandler(
      BindException e) {
    log.error("参数实体异常:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    FieldError fieldError = e.getBindingResult().getFieldError();
    String message = "";
    if (fieldError != null) {
      message = fieldError.getDefaultMessage();
    }
    return Result.failure(ResultReturn.PARAM_NOT_COMPLETE, message);
  }

  /**
   * @Description:Service层异常
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/16
   */
  @ResponseBody
  @ExceptionHandler(value = ServiceException.class)
  public Result serviceExceptionHandler(
      Exception e) {
    log.error("Service层异常" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.SERVICE_ERROR);
  }

  /**
   * @Description:Dao层异常
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/16
   */
  @ResponseBody
  @ExceptionHandler(value = DataAccessException.class)
  public Result dataAccessExceptionHandler(
      DataAccessException e) {
    SQLException exception = (SQLException) e.getCause();
    if (exception != null) {
      log.error("sql语句异常: " + exception.toString());
      log.error("定位: " + exception.getStackTrace()[0].toString());
      return Result.failure(ResultReturn.BAD_SQL_ERROR);
    }
    log.error("Dao层异常" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.MAPPER_ERROR);
  }

  /**
   * @Description: 处理Exception异常
   * @Param: [httpServletRequest, e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = Exception.class)
  public Result exceptionHandler(HttpServletRequest httpServletRequest,
      Exception e) {
    if (e instanceof RuntimeException) {
      log.error("运行时错误: " + e.toString());
      log.error("定位: " + e.getStackTrace()[0].toString());
      return Result.failure(ResultReturn.SYSTEM_INNER_ERROR);
    }
    log.error("不知名错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultReturn.UNKNOWN_ERROR);
  }
}

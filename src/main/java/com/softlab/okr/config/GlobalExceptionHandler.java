package com.softlab.okr.config;

import com.softlab.okr.exception.ControllerException;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import io.jsonwebtoken.ExpiredJwtException;
import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.exceptions.IbatisException;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
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
      return Result.failure(ResultCode.SYSTEM_INNER_ERROR);
    }
    log.error("不知名错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.UNKNOWN_ERROR);
  }

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
      Exception e) {
    log.error("IO错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.IO_ERROR);
  }

  /**
   * @Description:认证异常处理类
   * @Param: [httpServletRequest, e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = AuthenticationException.class)
  public Result authenticationExceptionHandler(HttpServletRequest httpServletRequest,
      Exception e) {
    log.error("认证错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.PERMISSION_NO_ACCESS);
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
      Exception e) {
    log.error("用户错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.USER_LOGIN_ERROR);
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
      Exception e) {
    log.error("参数错误: " + e.toString());
    log.error("定位: " + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.PARAM_NOT_COMPLETE, e.getMessage());
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
      Exception e) {
    log.error("用户Token已过期:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.USER_TOKEN_EXPIRE);
  }

  /**
   * @Description:
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = AccessDeniedException.class)
  public Result AccessDeniedExceptionHandler(
      Exception e) {
    log.error("用户没有相关权限访问:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.PERMISSION_NO_ACCESS);
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
      Exception e) {
    log.error("Mybatis持久化层错误:" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.IBATIS_ERROR);
  }

  /**
   * @Description: 控制层异常
   * @Param: [ e]
   * @return: com.softlab.okr.utils.Result
   * @Author: radCircle
   * @Date: 2021/7/10
   */
  @ResponseBody
  @ExceptionHandler(value = ControllerException.class)
  public Result controllerExceptionHandler(
      ControllerException e) {
    log.error("控制层异常 code:" + e.getResultCode().toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(e.getResultCode());
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
      ControllerException e) {
    log.error("Service层异常" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.SERVICE_ERROR);
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
      Exception e) {
    SQLException exception = (SQLException) e.getCause();
    if (exception != null) {
      log.error("sql语句异常: " + exception.toString());
      log.error("定位: " + exception.getStackTrace()[0].toString());
      return Result.failure(ResultCode.BAD_SQL_ERROR);
    }
    log.error("Dao层异常" + e.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + e.getStackTrace()[0].toString());
    return Result.failure(ResultCode.MAPPER_ERROR);
  }
}

package com.softlab.okr.config;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-31 11:53
 **/

import com.softlab.okr.security.AuthenticationService;
import com.softlab.okr.service.LoginLogService;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Slf4j
@Aspect
@Component
public class WebLogAspect {


  ThreadLocal<Long> startTime = new ThreadLocal<>();

  @Autowired
  private AuthenticationService authenticationService;

  @Autowired
  private LoginLogService loginLogService;

  /**
   * 定义切入点，以controller下所有包的请求为切入点
   */
  @Pointcut("execution(* com.softlab.okr.controller..*.*(..))*")
  public void weblog() {

  }

  /**
   * 前置通知：在切入点之前执行的通知
   *
   * @param joinPoint
   * @throws Exception
   */
  @Before("weblog()")
  public void doBefore(JoinPoint joinPoint) throws Exception {
    log.info("请求开始");
    startTime.set(System.currentTimeMillis());
  }

  /**
   * 后置最终通知,计算请求时间和记录
   *
   * @throws Exception
   */
  @After("weblog()")
  public void doAfter() throws Exception {
    log.info("请求结束");
    ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder
        .getRequestAttributes();
    HttpServletRequest request = servletRequestAttributes.getRequest();
    String path = request.getRequestURI();
    Authentication authentication = authenticationService.getAuthentication();
    String username = authentication.getName();
    String ip = ((WebAuthenticationDetails) authentication.getDetails()).getRemoteAddress();
    long duration = System.currentTimeMillis() - startTime.get();
    loginLogService.saveLog(ip, username, duration);
    log.info("username:{}", username);
    log.info("ip:{}", ip);
    log.info("path:{}", path);
    log.info(" 时间消耗: {} ms", duration);
  }
}


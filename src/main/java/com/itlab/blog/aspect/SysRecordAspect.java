package com.itlab.blog.aspect;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-31 11:53
 **/

import com.itlab.blog.entity.SysRecord;
import com.itlab.blog.service.ISysRecordService;
import com.itlab.blog.utils.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.Future;

@Slf4j
@Aspect
@Component
@Order(3)
public class SysRecordAspect {


    ThreadLocal<Long> startTime = new ThreadLocal<>();

    @Autowired
    private ISysRecordService sysRecordService;

    /**
     * 定义切入点，以controller下所有包的请求为切入点
     */
    @Pointcut("execution(* com.itlab.blog.controller..*.*(..))")
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
        ServletRequestAttributes servletRequestAttributes =
                (ServletRequestAttributes) RequestContextHolder
                        .getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes != null ? servletRequestAttributes.getRequest() : null;
        String username = SecurityUtil.getUsername();
        String ip = SecurityUtil.getRequestIp();
        String path = SecurityUtil.getRequestPath(request);
        long duration = System.currentTimeMillis() - startTime.get();
        SysRecord sysRecord = new SysRecord(null, null, path, username, ip, null, duration);
        //long start = System.currentTimeMillis();
        Future<Integer> result = sysRecordService.saveLog(sysRecord);
        //log.info("cost:{}", System.currentTimeMillis() - start);
        log.info("path:{},userId:{},ip:{},duration:{} ms", path, username, ip, duration);
    }
}


package com.softlab.okr.aspect;

import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.utils.RedisUtil;
import com.softlab.okr.utils.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:19
 **/
@Aspect
@Component
@Slf4j
@Order(1)
public class LimitedAccessAspect {

    public static String IPLimit = "IpLimit";

    public static String BLACKLIST = "BlackList";

    public static Integer FREQUENCY = 20;

    public static Integer SECOND = 60;

    public static Integer DETENTION = 30 * 60;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private RedisUtil redisUtil;

    /**
     * 调用切面类
     *
     * @param
     */
    @Pointcut("execution(* com.softlab.okr.controller..*.*(..))")
    public void pointCut() {
    }

    @Before("pointCut()")
    public void doBefore() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        if (null != attributes) {
            //String realRequestIps = request.getHeader("X-Forwarded-For");
            //log.info("realRequestIps地址:" + realRequestIps);
            HttpServletRequest request = attributes.getRequest();
            String ip = securityUtil.getRequestIp();
            this.isInBlackList(ip);
            String ipLimitKey = IPLimit + "#" + ip;

            Integer limit = (Integer) redisUtil.get(ipLimitKey);
            if (null != limit) {
                // 时间段内超过访问频次上限 - 阻断,并加入黑名单
                if (limit >= FREQUENCY) {
                    redisUtil.set(BLACKLIST + "#" + ip, 1, DETENTION);
                    throw new BusinessException("请求频率过快");
                }
                redisUtil.incr(ipLimitKey, 1);
            } else {
                redisUtil.set(ipLimitKey, 1, SECOND);
            }
        }
    }

    public void isInBlackList(String ip) {
        String blackListKey = BLACKLIST + "#" + ip;
        Object flag = redisUtil.get(blackListKey);
        if (null != flag) {
            throw new BusinessException("您访问过快，ip进入黑名单，暂时无法访问");
        }
    }
}

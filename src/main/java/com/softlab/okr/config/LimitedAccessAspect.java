package com.softlab.okr.config;

import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.utils.FilterUtil;
import com.softlab.okr.utils.RedisUtil;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:19
 **/
@Aspect
@Component
@Log4j2
@Order(1)
public class LimitedAccessAspect {

  public static String Collection = "IpLimit";

  @Autowired
  private RedisUtil redisUtil;

  @Autowired
  private FilterUtil filterUtil;

  /**
   * 调用切面类
   *
   * @param limitedAccess
   */
  @Pointcut("@annotation(limitedAccess)")
  public void limitAccessPointCut(LimitedAccess limitedAccess) {
  }

  @Before(value = "limitAccessPointCut(limitedAccess)", argNames = "point,limitedAccess")
  public void doBefore(JoinPoint point, LimitedAccess limitedAccess) {
    ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
        .getRequestAttributes();
    if (null != attributes) {
      //String methodName = point.getSignature().getName();
      HttpServletRequest request = attributes.getRequest();
      String path = filterUtil.getRequestPath(request);
      String ip = filterUtil.getRequestIp();
      log.info("ip地址：" + ip);
      //String realRequestIps = request.getHeader("X-Forwarded-For");
      //log.info("realRequestIps地址:" + realRequestIps);
      String key = Collection + "." + path + "#" + ip;
      try {
        Integer limit = (Integer) redisUtil.get(key);
        if (limit > 0) {
          // 时间段内超过访问频次上限 - 阻断
          if (limit >= limitedAccess.frequency()) {
            log.info("接口调用过于频繁 {}", key);
            throw new Exception();
          }
          redisUtil.incr(key, 1);
        } else {
          redisUtil.set(key, 1, limitedAccess.second());
        }
      } catch (Exception e) {
        log.debug(e.getStackTrace());
      }
    }
  }
}

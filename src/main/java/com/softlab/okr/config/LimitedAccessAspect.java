package com.softlab.okr.config;

import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.utils.DataCacheRepository;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
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
//@Order
public class LimitedAccessAspect {

  public static String LIMITED_ACCESS_ASPECT_COLLECTION = "LIMITED_ACCESS_ASPECT_COLLECTION";

  @Autowired
  private DataCacheRepository redisCacheService;

  @Pointcut("@annotation(limitedAccess)")
  public void limitAccessPointCut(LimitedAccess limitedAccess) {
    // 限制接口调用切面类
  }

  @Around(value = "limitAccessPointCut(limitedAccess)", argNames = "point,limitedAccess")
  public Object doAround(ProceedingJoinPoint point, LimitedAccess limitedAccess) throws Throwable {
    ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
        .getRequestAttributes();
    if (null != attributes) {
      String className = point.getTarget().getClass().getName();
      String methodName = point.getSignature().getName();
      HttpServletRequest request = attributes.getRequest();
      String remoteAddr = request.getRemoteAddr();
      log.info("remoteAddr地址：" + remoteAddr);
      //String realRequestIps = request.getHeader("X-Forwarded-For");
      String key =
          LIMITED_ACCESS_ASPECT_COLLECTION + className + "." + methodName + "#" + remoteAddr;
      try {
        long limit = redisCacheService.get(key);
        if (limit > 0) {
          // 时间段内超过访问频次上限 - 阻断
          if (limit >= limitedAccess.frequency()) {
            log.info("接口调用过于频繁 {}", key);
//
            return "接口调用过于频繁！！！";
          }
          redisCacheService.increment(key);
        } else {
          redisCacheService.set(key, 1, limitedAccess.second());
        }
      } catch (Exception e) {
        log.debug(e.getStackTrace());
      }
    }
    return point.proceed();
  }
}

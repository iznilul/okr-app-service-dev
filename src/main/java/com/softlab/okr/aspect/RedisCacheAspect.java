package com.softlab.okr.aspect;

import com.softlab.okr.annotation.RedisCache;
import com.softlab.okr.utils.RedisUtil;
import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:19
 **/
@Aspect
@Component
@Log4j2
@Order(3)
public class RedisCacheAspect {

  public static String IPLimit = "IpLimit";

  public static String BLACKLIST = "BlackList";

  @Autowired
  private RedisUtil redisUtil;

  /**
   * 调用切面类
   *
   * @param
   */
  @Pointcut("@annotation(redisCache)")
  public void RedisPointCut(RedisCache redisCache) {
  }

  //@Before(value = "limitAccessPointCut(limitedAccess)", argNames = "limitedAccess")
  //public void doBefore(LimitedAccess limitedAccess) throws IPLimitException {
  //  ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
  //      .getRequestAttributes();
  //  if (null != attributes) {
  //    //String methodName = point.getSignature().getName();
  //    //String realRequestIps = request.getHeader("X-Forwarded-For");
  //    //log.info("realRequestIps地址:" + realRequestIps);
  //    HttpServletRequest request = attributes.getRequest();
  //    String ip = filterUtil.getRequestIp();
  //    this.isInBlackList(ip);
  //    String ipLimitKey = IPLimit + "#" + ip;
  //    Integer limit = (Integer) redisUtil.get(ipLimitKey);
  //    if (null != limit) {
  //      // 时间段内超过访问频次上限 - 阻断,并加入黑名单
  //      if (limit >= limitedAccess.frequency()) {
  //        redisUtil.set(BLACKLIST + "#" + ip, 1, limitedAccess.second());
  //        throw new IPLimitException();
  //      }
  //      redisUtil.incr(ipLimitKey, 1);
  //    } else {
  //      redisUtil.set(ipLimitKey, 1, limitedAccess.second());
  //    }
  //  }
  //}
  //
  //public void isInBlackList(String ip) {
  //  String blackListKey = BLACKLIST + "#" + ip;
  //  Object flag = redisUtil.get(blackListKey);
  //  if (null != flag) {
  //    throw new RuntimeException();
  //  }
  //}
}

package com.softlab.okr.aspect;

import com.softlab.okr.annotation.LimitedAccess;
import com.softlab.okr.exception.BlackListException;
import com.softlab.okr.exception.IPLimitException;
import com.softlab.okr.model.enums.returnCode.IPReturn;
import com.softlab.okr.utils.FilterUtil;
import com.softlab.okr.utils.RedisUtil;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.log4j.Log4j2;
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

  public static String IPLimit = "IpLimit";

  public static String BLACKLIST = "BlackList";

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

  @Before(value = "limitAccessPointCut(limitedAccess)", argNames = "limitedAccess")
  public void doBefore(LimitedAccess limitedAccess) throws IPLimitException {
    ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
        .getRequestAttributes();
    if (null != attributes) {
      //String methodName = point.getSignature().getName();
      //String realRequestIps = request.getHeader("X-Forwarded-For");
      //log.info("realRequestIps地址:" + realRequestIps);
      HttpServletRequest request = attributes.getRequest();
      String ip = filterUtil.getRequestIp();
      this.isInBlackList(ip);
      String ipLimitKey = IPLimit + "#" + ip;
      Integer limit = (Integer) redisUtil.get(ipLimitKey);
      if (null != limit) {
        // 时间段内超过访问频次上限 - 阻断,并加入黑名单
        if (limit >= limitedAccess.frequency()) {
          redisUtil.set(BLACKLIST + "#" + ip, 1, limitedAccess.second());
          throw new IPLimitException(IPReturn.TOO_FAST);
        }
        redisUtil.incr(ipLimitKey, 1);
      } else {
        redisUtil.set(ipLimitKey, 1, limitedAccess.second());
      }
    }
  }

  public void isInBlackList(String ip) {
    String blackListKey = BLACKLIST + "#" + ip;
    Object flag = redisUtil.get(blackListKey);
    if (null != flag) {
      throw new BlackListException(IPReturn.BLACK_LIST);
    }
  }
}

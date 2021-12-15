package com.softlab.okr.aspect;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:19
 **/
//@Aspect
//@Component
//@Log4j2
//@Order(1)
//public class LimitedAccessAspect {
//
//    public static String IPLimit = "IpLimit";
//
//    public static String BLACKLIST = "BlackList";
//
//    @Autowired
//    private RedisUtil redisUtil;
//
//    @Autowired
//    private FilterUtil filterUtil;
//
//    /**
//     * 调用切面类
//     *
//     * @param limitedAccess
//     */
//    @Pointcut("@annotation(limitedAccess)")
//    public void limitAccessPointCut(LimitedAccess limitedAccess) {
//    }
//
//    @Before(value = "limitAccessPointCut(limitedAccess)", argNames = "limitedAccess")
//    public void doBefore(LimitedAccess limitedAccess) {
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder
//                .getRequestAttributes();
//        if (null != attributes) {
//            //String methodName = point.getSignature().getName();
//            //String realRequestIps = request.getHeader("X-Forwarded-For");
//            //log.info("realRequestIps地址:" + realRequestIps);
//            HttpServletRequest request = attributes.getRequest();
//            String ip = filterUtil.getRequestIp();
//            this.isInBlackList(ip);
//            String ipLimitKey = IPLimit + "#" + ip;
//            Integer limit = (Integer) redisUtil.get(ipLimitKey);
//            if (null != limit) {
//                // 时间段内超过访问频次上限 - 阻断,并加入黑名单
//                if (limit >= limitedAccess.frequency()) {
//                    redisUtil.set(BLACKLIST + "#" + ip, 1, limitedAccess.second());
//                    throw new BusinessException("请求频率过快");
//                }
//                redisUtil.incr(ipLimitKey, 1);
//            } else {
//                redisUtil.set(ipLimitKey, 1, limitedAccess.second());
//            }
//        }
//    }
//
//    public void isInBlackList(String ip) {
//        String blackListKey = BLACKLIST + "#" + ip;
//        Object flag = redisUtil.get(blackListKey);
//        if (null != flag) {
//            throw new BusinessException("由于您的主机ip进了黑名单，暂时无法访问");
//        }
//    }
//}

package com.itlab.blog.aspect;

import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.utils.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.concurrent.TimeUnit;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:19
 **/
@Aspect
@Component
@Slf4j
@Order(2)
public class RepeatSubmitAspect {

    public static final String LOCK_KEY_PREFIX = "REPEAT_SUBMIT_LOCK_";

    public static final Integer LOCK_KEY_EXPIRED_SECOND = 60;

    private String lockKey;

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 调用切面类
     *
     * @param
     */
    @Pointcut("@annotation(com.itlab.blog.annotation.DisableRepeatSubmit)")
    public void pointCut() {
    }

    @Before("pointCut()")
    public void lock() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (attributes == null) {
            return;
        }
        String requestURI = attributes.getRequest().getRequestURI();
        String username = SecurityUtil.getUsername();
        String lockKey = generatorLockKey(requestURI, username);

        Boolean locked = redisTemplate.opsForValue().setIfAbsent(lockKey, requestURI, LOCK_KEY_EXPIRED_SECOND,
                TimeUnit.SECONDS);

        if (locked == Boolean.FALSE) {
            log.info("repeat submit username:{} / uri:{}", username, requestURI);
            throw new BusinessException("重复提交错误");
        }
        log.info("lockedKey:{}", lockKey);
        this.lockKey = lockKey;
    }

    @After("pointCut()")
    public void unLock() {
        Boolean delete = redisTemplate.delete(lockKey);
        if (delete == Boolean.FALSE) {
            log.warn("unlock failed. lockKey:{}", lockKey);
        }
    }

    private String generatorLockKey(String uri, String userName) {
        String key = userName + "_" + uri;
        return LOCK_KEY_PREFIX + key;
    }

}

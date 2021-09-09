package com.softlab.okr.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Duration;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.support.atomic.RedisAtomicLong;
import org.springframework.stereotype.Repository;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:14
 **/
@Slf4j
@Repository
public class CacheRepository<T> implements DataCacheRepository<T> {

  private static final ObjectMapper OBJECT_MAPPER;
  private static final TimeZone DEFAULT_TIMEZONE = TimeZone.getTimeZone("UTC");

  static {
    OBJECT_MAPPER = new ObjectMapper();
    OBJECT_MAPPER.setTimeZone(DEFAULT_TIMEZONE);
  }


  @Autowired
  RedisTemplate template; // and we're in business
  @Value("${redis.default.timeout}00")
  Long defaultTimeOut;

  public boolean addPermentValue(String collection, String hkey, T object) {
    try {
      String jsonObject = OBJECT_MAPPER.writeValueAsString(object);
      template.opsForHash().put(collection, hkey, jsonObject);
      return true;
    } catch (Exception e) {
      log.error("Unable to add object of key {} to cache collection '{}': {}", hkey, collection,
          e.getMessage());
      return false;
    }
  }

  @Override
  public boolean add(String collection, String hkey, T object, Long timeout) {

    Long localTimeout;
    if (timeout == null) {
      localTimeout = defaultTimeOut;
    } else {
      localTimeout = timeout;
    }
    try {
      String jsonObject = OBJECT_MAPPER.writeValueAsString(object);
      template.opsForHash().put(collection, hkey, jsonObject);
      template.expire(collection, localTimeout, TimeUnit.SECONDS);
      return true;
    } catch (Exception e) {
      log.error("Unable to add object of key {} to cache collection '{}': {}", hkey, collection,
          e.getMessage());
      return false;
    }
  }

  @Override
  public boolean delete(String collection, String hkey) {
    try {
      template.opsForHash().delete(collection, hkey);
      return true;
    } catch (Exception e) {
      log.error("Unable to delete entry {} from cache collection '{}': {}", hkey, collection,
          e.getMessage());
      return false;
    }
  }

  @Override
  public T find(String collection, String hkey, Class<T> tClass) {
    try {
      String jsonObj = String.valueOf(template.opsForHash().get(collection, hkey));
      return OBJECT_MAPPER.readValue(jsonObj, tClass);
    } catch (Exception e) {
      if (e.getMessage() == null) {
        log.error("Entry '{}' does not exist in cache", hkey);
      } else {
        log.error("Unable to find entry '{}' in cache collection '{}': {}", hkey, collection,
            e.getMessage());
      }
      return null;
    }
  }

  @Override
  public Boolean isAvailable() {
    try {
      return template.getConnectionFactory().getConnection().ping() != null;
    } catch (Exception e) {
      log.warn("Redis server is not available at the moment.");
    }
    return false;
  }

  @Override
  public Boolean lock(String key, String value, Long second) {
    Boolean absent = template.opsForValue().setIfAbsent(key, value, second, TimeUnit.SECONDS);
    return absent;
  }

  @Override
  public Object getValue(String key) {
    return template.opsForValue().get(key);
  }

  @Override
  public void unLock(String key) {
    template.delete(key);
  }

  @Override
  public void increment(String key) {
    RedisAtomicLong counter = new RedisAtomicLong(key, template.getConnectionFactory());
    counter.incrementAndGet();
  }

  @Override
  public void setIfAbsent(String key, long value, long ttl) {
    ValueOperations<String, Object> ops = template.opsForValue();
    ops.setIfAbsent(key, value, Duration.ofSeconds(ttl));
  }

  @Override
  public Long get(String key) {
    RedisAtomicLong counter = new RedisAtomicLong(key, template.getConnectionFactory());
    return counter.get();
  }

  @Override
  public void set(String key, long value, long ttl) {
    RedisAtomicLong counter = new RedisAtomicLong(key, template.getConnectionFactory());
    counter.set(value);
    counter.expire(ttl, TimeUnit.SECONDS);
  }

  @Override
  public void set(Object key, Object value, long ttl) {
    template.opsForValue().set(key, value, ttl, TimeUnit.SECONDS);
  }

  @Override
  public Object getByKey(String key) {
    return template.opsForValue().get(key);
  }

  @Override
  public void getLock(String key, String clientID) throws Exception {
    Boolean lock = false;

    // 重试3次,每间隔1秒重试1次
    for (int j = 0; j <= 3; j++) {
      lock = lock(key, clientID, 10L);
      if (lock) {
        log.info("获得锁》》》" + key);
        break;
      }
      try {
        Thread.sleep(5000);
      } catch (InterruptedException e) {
        log.error("线程休眠异常", e);
        break;
      }
    }
    // 重试3次依然没有获取到锁，那么返回服务器繁忙,请稍后重试
    if (!lock) {
      throw new Exception("服务繁忙");
    }
  }

  @Override
  public void releaseLock(String key, String clientID) {
    if (clientID.equals(getByKey(key))) {
      unLock(key);
    }
  }
}

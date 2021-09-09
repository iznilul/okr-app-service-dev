package com.softlab.okr.utils;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-09-10 00:13
 **/
public interface DataCacheRepository<T> {

  boolean add(String collection, String hkey, T object, Long timeout);

  boolean delete(String collection, String hkey);

  T find(String collection, String hkey, Class<T> tClass);

  Boolean isAvailable();

  /**
   * redis 加锁
   *
   * @param key
   * @param second
   * @return
   */
  Boolean lock(String key, String value, Long second);

  Object getValue(String key);

  /**
   * redis 解锁
   *
   * @param key
   * @return
   */
  void unLock(String key);

  void setIfAbsent(String key, long value, long ttl);

  void increment(String key);

  Long get(String key);

  void set(String key, long value, long ttl);

  void set(Object key, Object value, long ttl);

  Object getByKey(String key);


  void getLock(String key, String clientID) throws Exception;

  void releaseLock(String key, String clientID);
}

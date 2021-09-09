package com.softlab.okr.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LimitedAccess {

  /**
   * 从第一次访问接口的时间到周期时间内，最大访问频率次，默认60次
   *
   * @return
   */
  long frequency() default 60;

  /**
   * 周期时间,默认30分钟内
   *
   * @return
   */
  long second() default 30 * 60;
}
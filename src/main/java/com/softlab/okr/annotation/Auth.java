package com.softlab.okr.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 权限注解，用于标识需要权限处理的接口
 *
 * @author RudeCrab
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD, ElementType.TYPE})
public @interface Auth {
    /**
     * 角色权限
     */
    String role();
    /**
     * 接口名
     */
    String name();
}

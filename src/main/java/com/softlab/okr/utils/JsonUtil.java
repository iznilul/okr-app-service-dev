package com.softlab.okr.utils;

import com.alibaba.fastjson.JSON;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2022-04-15 20:10
 **/
public class JsonUtil {

    public static final String YYYY_MM_DD_HH_MM_SS_SSS = "yyyy-MM-dd HH:mm:ss.SSS";

    public static <T> T toObject(String json, Class<T> clazz) {
        return JSON.parseObject(json, clazz);
    }

    public static <T> List<T> toList(String json, Class<T> clazz) {
        return JSON.parseArray(json, clazz);
    }

    public static String toJsonString(Object object) {
        return JSON.toJSONString(object);
    }

    public static String toJsonStringWithDateFormat(Object object) {
        return JSON.toJSONStringWithDateFormat(object, YYYY_MM_DD_HH_MM_SS_SSS);
    }
}

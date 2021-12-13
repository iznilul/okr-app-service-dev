package com.softlab.okr.constant;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-11-14 18:44
 **/
public class TimeFormat {

    /**
     * 时间戳格式
     */
    public static DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String neverExpire = "2100-01-01 00:00:00";
}

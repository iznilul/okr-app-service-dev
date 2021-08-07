package com.softlab.okr.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:37
 */
public class IPUtils {

    /**
     * 获取主机名称
     *
     * @return
     * @throws UnknownHostException
     */
    public static String getHostName() throws UnknownHostException {
        return InetAddress.getLocalHost().getHostName();
    }

    /**
     * 获取系统首选IP
     *
     * @return
     * @throws UnknownHostException
     */
    public static String getHostIP() throws UnknownHostException {
        return InetAddress.getLocalHost().getHostAddress();
    }
}

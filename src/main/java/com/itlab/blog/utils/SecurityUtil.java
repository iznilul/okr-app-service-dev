package com.itlab.blog.utils;

import com.itlab.blog.security.UserDetail;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-06 13:46
 **/
public class SecurityUtil {

    private static Authentication getAuthentication() {
        SecurityContext context = SecurityContextHolder.getContext();
        return context.getAuthentication();
    }

    private static UserDetail getPrincipal() {
        Authentication authentication = getAuthentication();
        if (authentication == null) {
            return null;
        }
        Object object = authentication.getPrincipal();
        if (object instanceof String) {
            return null;
        }
        return (UserDetail) object;
    }

    public static String getRequestIp() {
        Authentication authentication = getAuthentication();
        return ((WebAuthenticationDetails) authentication.getDetails()).getRemoteAddress();
    }

    public static String getRequestPath(HttpServletRequest request) {
        return request != null ? request.getRequestURI() : null;
    }

    public static String getUsername() {
        UserDetail userDetail = getPrincipal();
        return userDetail == null ? null : userDetail.getUsername();
    }

    public static Integer getUserId() {
        UserDetail userDetail = getPrincipal();
        return userDetail == null ? null : userDetail.getUserId();
    }
}

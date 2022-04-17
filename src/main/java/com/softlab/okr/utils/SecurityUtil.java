package com.softlab.okr.utils;

import com.softlab.okr.security.AuthenticationServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-06 13:46
 **/
@Component
public class SecurityUtil {

    @Autowired
    private AuthenticationServiceImpl authenticationService;

    public String getRequestIp() {
        Authentication authentication = authenticationService.getAuthentication();
        return ((WebAuthenticationDetails) authentication.getDetails()).getRemoteAddress();
    }

    public String getRequestPath(HttpServletRequest request) {
        return request != null ? request.getRequestURI() : null;
    }

    public String getRequestUsername() {
        return authenticationService.getUsername();
    }

    public Integer getRequestUserId() {
        return authenticationService.getUserId();
    }

}

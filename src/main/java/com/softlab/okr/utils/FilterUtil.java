package com.softlab.okr.utils;

import com.softlab.okr.security.AuthenticationService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-06 13:46
 **/
@Component
public class FilterUtil {

  @Autowired
  private AuthenticationService authenticationService;

  public String getRequestIp() {
    Authentication authentication = authenticationService.getAuthentication();
    return ((WebAuthenticationDetails) authentication.getDetails()).getRemoteAddress();
  }

  public String getRequestPath(HttpServletRequest request) {
    return request.getRequestURI();
  }

  public String getRequestUsername() {
    Authentication authentication = authenticationService.getAuthentication();
    return authentication.getName();
  }

}

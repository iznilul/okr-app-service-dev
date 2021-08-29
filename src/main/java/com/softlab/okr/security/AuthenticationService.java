package com.softlab.okr.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-29 22:28
 **/
@Service
public class AuthenticationService implements IAuthentication {


  @Override
  public Authentication getAuthentication() {
    return SecurityContextHolder.getContext().getAuthentication();
  }

  @Override
  public UserDetail getPrincipal() {
    return (UserDetail) this.getAuthentication().getPrincipal();
  }
}


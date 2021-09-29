package com.softlab.okr.security;

import com.softlab.okr.service.IUserEntityService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class AuthenticationServiceImpl implements IAuthenticationService {

  @Autowired
  private IUserEntityService userEntityService;

  @Override
  public Authentication getAuthentication() {
    return SecurityContextHolder.getContext().getAuthentication();
  }

  @Override
  public UserDetail getPrincipal() {
    return (UserDetail) this.getAuthentication().getPrincipal();
  }

  @Override
  public Integer getUserId() {
    String username = this.getPrincipal().getUsername();
    return userEntityService.getByUsername(username).getUserId();
  }

  @Override
  public String getUsername() {
    return getPrincipal().getUsername();
  }
}


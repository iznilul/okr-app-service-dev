package com.itlab.blog.security;

import org.springframework.security.core.Authentication;

public interface IAuthenticationService {

  Authentication getAuthentication();

  UserDetail getPrincipal();

  Integer getUserId();

  String getUsername();
}

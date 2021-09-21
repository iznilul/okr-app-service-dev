package com.softlab.okr.security;

import org.springframework.security.core.Authentication;

public interface IAuthenticationService {

  Authentication getAuthentication();

  UserDetail getPrincipal();

  Integer getUserId();
}

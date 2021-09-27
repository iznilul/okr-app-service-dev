package com.softlab.okr.security;

import org.springframework.security.core.Authentication;

public interface IAuthentication {

  Authentication getAuthentication();

  UserDetail getPrincipal();
}

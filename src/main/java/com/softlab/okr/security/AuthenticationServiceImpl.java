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
        Authentication authentication = this.getAuthentication();
        if (authentication == null) {
            return null;
        }
        Object object = authentication.getPrincipal();
        if (object instanceof String) {
            return null;
        }
        return (UserDetail) object;
    }

    @Override
    public Integer getUserId() {
        UserDetail userDetail = getPrincipal();
        return userDetail == null ? null : userDetail.getUserId();
    }

    @Override
    public String getUsername() {
        return getPrincipal() != null ? getPrincipal().getUsername() : null;
    }
}


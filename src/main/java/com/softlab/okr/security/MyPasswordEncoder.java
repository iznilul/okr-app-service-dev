package com.softlab.okr.security;

import com.softlab.okr.utils.MD5Util;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-14 15:59
 **/

public class MyPasswordEncoder implements PasswordEncoder {

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        String password = MD5Util.string2MD5((String) rawPassword);
        boolean flag = encodedPassword.equals(password);
        return flag;
    }

    @Override
    public String encode(CharSequence rawPassword) {
        return MD5Util.string2MD5((String) rawPassword);
    }
}

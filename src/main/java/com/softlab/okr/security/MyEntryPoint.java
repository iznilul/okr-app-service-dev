package com.softlab.okr.security;

import com.alibaba.fastjson.JSON;
import com.softlab.okr.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录认证错误处理器
 *
 * @author RudeCrab
 */
@Slf4j
public class MyEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
                         AuthenticationException e) throws IOException {
        log.error("用户没有登录");
        e.printStackTrace();
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        //封装一个结果返回类
        out.write(JSON.toJSONString(Result.failure("此操作需要登录")));
        out.flush();
        out.close();
    }
}

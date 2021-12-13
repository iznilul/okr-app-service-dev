package com.softlab.okr.security;

import com.alibaba.fastjson.JSON;
import com.softlab.okr.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 授权错误处理器
 *
 * @author RudeCrab
 */
@Slf4j
public class MyDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException e) throws IOException {
        log.error("用户没有相关权限访问");
        e.printStackTrace();
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(JSON.toJSONString(Result.failure("权限不足")));
        out.flush();
        out.close();
    }
}

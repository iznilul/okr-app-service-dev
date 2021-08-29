package com.softlab.okr.security;

import com.alibaba.fastjson.JSON;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 13:01
 **/
@Component
@Slf4j
public class MyLogoutSuccessHandler implements LogoutSuccessHandler {

  @Override
  public void onLogoutSuccess(HttpServletRequest request,
      HttpServletResponse response,
      Authentication authentication)
      throws IOException, ServletException {
    //这里书写你自己的退出业务逻辑
    log.info("用户注销: " + authentication.getName());
    response.setContentType("application/json;charset=utf-8");
    PrintWriter out = response.getWriter();
    //封装一个结果返回类
    out.write(JSON.toJSONString(Result.success()));
    out.flush();
    out.close();
  }
}

package com.softlab.okr.security;

import com.alibaba.fastjson.JSON;
import com.softlab.okr.model.enums.returnCode.ResultReturn;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * 授权错误处理器
 *
 * @author RudeCrab
 */
@Slf4j
public class MyDeniedHandler implements AccessDeniedHandler {

  @Override
  public void handle(HttpServletRequest request, HttpServletResponse response,
      AccessDeniedException accessDeniedException) throws IOException,
      ServletException {
    log.error("用户没有相关权限访问:" + accessDeniedException.toString());
    //定位打印抛出错误的地方
    log.error("定位:" + accessDeniedException.getStackTrace()[0].toString());
    response.setContentType("application/json;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.write(JSON.toJSONString(Result.failure(ResultReturn.PERMISSION_NO_ACCESS)));
    out.flush();
    out.close();
  }
}

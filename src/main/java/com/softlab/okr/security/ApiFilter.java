package com.softlab.okr.security;

import com.alibaba.fastjson.JSON;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.ResultCode;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-21 00:20
 */
@Slf4j
public class ApiFilter implements Filter {

  @Getter
  @Setter
  private static Set<Resource> resources = new HashSet<>();

  @Override
  public void init(FilterConfig arg0) throws ServletException {
    // System.out.println("----Filter初始化----");
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
      throws IOException, ServletException {
    log.info("----ApiFilter 接口过滤器----");
    HttpServletRequest httpServletRequest = (HttpServletRequest) request;
    String path = ((HttpServletRequest) request).getRequestURI();
    for (Resource resource : resources) {
      if (resource.getPath().equals(path)) {
        if (resource.getStatus() == 1) {
          filterChain.doFilter(request, response); // 执行目标资源，放行
        } else {
          response.setContentType("application/json;charset=utf-8");
          PrintWriter out = response.getWriter();
          //封装一个结果返回类
          out.write(JSON.toJSONString(Result.failure(ResultCode.API_NOT_OPEN)));
          out.flush();
          out.close();
        }
        break;
      }
    }
  }

  @Override
  public void destroy() {
    // System.out.println("----Filter销毁----");
  }

  public static void updateResources(int resourceId) {
    for (Resource resource : resources) {
      if (resource.getResourceId() == resourceId) {
        resources.remove(resource);
        resource.setStatus(Math.abs(resource.getStatus() - 1));
        resources.add(resource);
        break;
      }
    }
  }
}

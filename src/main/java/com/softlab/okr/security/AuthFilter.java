package com.softlab.okr.security;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;

/**
 * 授权过滤器
 *
 * @author RudeCrab
 */
@Slf4j
@Component
public class AuthFilter extends AbstractSecurityInterceptor implements Filter {

  @Autowired
  private SecurityMetadataSource securityMetadataSource;

  private static final String FILTER_APPLIED = "__spring_security_filterSecurityInterceptor_filterApplied";

  @Override
  public SecurityMetadataSource obtainSecurityMetadataSource() {
    // 将我们自定义的SecurityMetadataSource给返回
    return this.securityMetadataSource;
  }

  @Override
  @Autowired
  public void setAccessDecisionManager(AccessDecisionManager accessDecisionManager) {
    // 将我们自定义的AccessDecisionManager给注入
    super.setAccessDecisionManager(accessDecisionManager);
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    if (request.getAttribute(FILTER_APPLIED) == null) {
      chain.doFilter(request, response);
      return;
    }
    log.info("---AuthFilter 认证过滤器---");

    FilterInvocation fi = new FilterInvocation(request, response, chain);
    // 这里调用了父类的AbstractSecurityInterceptor的方法,也就是调用了accessDecisionManager
    InterceptorStatusToken token = super.beforeInvocation(fi);

    try {
      // 执行下一个拦截器
      //fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
      chain.doFilter(request, response);
    } finally {
      super.afterInvocation(token, null);
    }
  }

  @Override
  public Class<?> getSecureObjectClass() {
    return FilterInvocation.class;
  }

  @Override
  public void init(FilterConfig filterConfig) {
  }

  @Override
  public void destroy() {
  }
}


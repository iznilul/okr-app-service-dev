package com.softlab.okr.security;

import com.softlab.okr.service.ServiceImpl.UserEntityServiceImpl;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 认证过滤器
 *
 * @author RudeCrab
 */
@Slf4j
@Component
public class LoginFilter extends OncePerRequestFilter {

  @Autowired
  private JwtManager jwtManager;

  @Autowired
  private UserEntityServiceImpl userService;


  @Override
  protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response,
      FilterChain chain) throws ServletException, IOException,
      ExpiredJwtException {
    log.info("---LoginFilter---");
    // 从请求头中获取token字符串并解析，判断token是不是合法的
    Claims claims = jwtManager.parse(request, response, request.getHeader("Authorization"));
    if (claims != null) {
      String username = claims.getSubject();
      UserDetails user = userService.loadUserByUsername(username);
      //生成令牌存到上下文之中
      UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
          user,
          user.getPassword(), user.getAuthorities());
      authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
      SecurityContextHolder.getContext().setAuthentication(authentication);
    }
    chain.doFilter(request, response);
  }
}

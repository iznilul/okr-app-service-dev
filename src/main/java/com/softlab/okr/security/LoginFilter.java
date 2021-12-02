package com.softlab.okr.security;

import com.softlab.okr.model.enums.ReturnEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.impl.UserEntityServiceImpl;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        log.info("---LoginFilter 登陆过滤器---");
        // 从请求头中获取token字符串并解析，判断token是不是合法的
        String token = request.getHeader("Authorization");
        //如果没有token，通用请求直接过滤
        if (token == null || token.equals("")) {
            chain.doFilter(request, response);
        }
        Claims claims = jwtManager.parse(request, response, token);
        if (claims != null) {
            String username = claims.getSubject();
            try {
                UserDetails user = userService.loadUserByUsername(username);
                //生成令牌存到上下文之中
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                        user,
                        user.getPassword(), user.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
            } catch (UsernameNotFoundException e) {
                log.error("没有找到用户");
                BusinessException exception = new BusinessException("没有找到用户");
                request.setAttribute("filter.error", exception);
                request.getRequestDispatcher("/error/throw").forward(request, response);
            } catch (BusinessException e) {
                log.error("权限过期");
                BusinessException exception = new BusinessException(ReturnEnum.ROLE_EXPIRED);
                request.setAttribute("filter.error", exception);
                request.getRequestDispatcher("/error/throw").forward(request, response);
            }
        } else {
            //如果令牌无效，就没有必要再过滤了，直接返回
            return;
        }
        chain.doFilter(request, response);
    }
}

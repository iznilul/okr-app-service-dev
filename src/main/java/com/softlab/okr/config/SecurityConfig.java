package com.softlab.okr.config;

import com.softlab.okr.security.*;
import com.softlab.okr.service.ServiceImpl.UserEntityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsUtils;

/** @author RudeCrab */
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired private UserEntityServiceImpl userDetailsService;

  @Autowired private LoginFilter loginFilter;

  @Autowired private AuthFilter authFilter;

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    // 关闭csrf和frameOptions，如果不关闭会影响前端请求接口（这里不展开细讲了，感兴趣的自行搜索，不难）
    http.csrf().disable();
    http.headers().frameOptions().disable();
    // 开启跨域以便前端调用接口
    http.cors();

    // 这是配置的关键，决定哪些接口开启防护，哪些接口绕过防护
    http.authorizeRequests()
        // 注意这里，是允许前端跨域联调的一个必要配置
        .requestMatchers(CorsUtils::isPreFlightRequest)
        .permitAll()
        // 指定某些接口不需要通过验证即可访问。像登陆、测试接口肯定是不需要认证的
        .antMatchers("/api/login", "/api/test", "/api/logout")
        .permitAll()
        // 这里意思是其它所有接口需要认证才能访问
        .antMatchers("/api/**")
        .authenticated()
        // 关于登录认证的错误处理器
        .and()
        .exceptionHandling()
        .authenticationEntryPoint(new MyEntryPoint())
        // 指定认证错误，权限不足处理器
        .accessDeniedHandler(new MyDeniedHandler());

    // 禁用session，因为要用JWT
    http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    // 将我们自定义的认证过滤器替换掉默认的认证过滤器,两个过滤器分别是登录过滤和权限过滤
    http.addFilterBefore(loginFilter, UsernamePasswordAuthenticationFilter.class);
    http.addFilterBefore(authFilter, FilterSecurityInterceptor.class);
  }

  // 登录认证三大组件，业务对象UserDetailsService，用户对象UserDetail，加密工具passwordEncoder需要自定义重写
  @Override
  protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    // 指定UserDetailService和加密器
    auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
  }

  @Bean
  @Override
  // AuthenticationManager 就是Spring Security用于执行身份验证的组件，只需要调用它的authenticate方法即可完成认证
  protected AuthenticationManager authenticationManager() throws Exception {
    return super.authenticationManager();
  }

  @Bean
  // 将密码加密类注入容器内部
  public PasswordEncoder passwordEncoder() {
    return new MyPasswordEncoder();
  }
}

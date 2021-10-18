package com.softlab.okr.security;

import com.qianxin.rdc2.mgtplatform.auth.annotion.LoaderSkipAuthURIApplication;
import com.qianxin.rdc2.mgtplatform.auth.config.SecurityProps;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

/**
 * @author: zhangbo
 * @description: 权限认证
 * @date: 2021/9/9 14:56
 * @version: 1.0
 */
@Slf4j
@Component
public class RbacPermissionService {

  private static final AntPathMatcher ANT_PATH_MATCHER = new AntPathMatcher();

  @Autowired
  private SecurityProps securityProps;

  public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
//        Object userInfo = authentication.getPrincipal();
//        if (userInfo instanceof UserDetails) {
//            if (!securityProps.getOpen()) {
//                log.debug("[未开启权限认证默认通过]");
//                return true;
//            }
//            String requestURI = request.getRequestURI();
//            //白名单默认通过
//            if (pass(requestURI)) {
//                log.debug("[白名单接口默认通过] requestURI:{}", requestURI);
//                return true;
//            }
//            LoginUser loginUser = (LoginUser) userInfo;
//            Collection<? extends GrantedAuthority> userAuthorities = loginUser.getAuthorities();
//            if (userAuthorities == null) {
//                return false;
//            }
//            for (GrantedAuthority userAuthority : userAuthorities) {
//                if (userAuthority instanceof UserGrantedAuthority) {
//                    UserGrantedAuthority authority = (UserGrantedAuthority) userAuthority;
//                    if (ANT_PATH_MATCHER.match(authority.getUrl(), requestURI)) {
//                        return true;
//                    }
//                }
//            }
//        }
//        return false;
    return true;
  }

  private boolean pass(String uri) {
    Set<String> whiteUrls = LoaderSkipAuthURIApplication.getWhiteUrls();
    if (whiteUrls != null && !whiteUrls.isEmpty()) {
      AntPathMatcher matcher = new AntPathMatcher();
      for (String whiteUrl : whiteUrls) {
        if (matcher.match(whiteUrl, uri)) {
          return true;
        }
      }
    }
    return false;
  }

}

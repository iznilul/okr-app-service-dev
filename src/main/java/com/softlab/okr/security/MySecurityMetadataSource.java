package com.softlab.okr.security;

import com.softlab.okr.entity.Resource;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author RudeCrab
 */
@Slf4j
@Component
public class MySecurityMetadataSource implements SecurityMetadataSource {

    /**
     * 当前系统所有url资源 当前系统所有接口资源对象，放在这里相当于一个缓存的功能。
     */
    @Getter
    @Setter
    private static Set<Resource> resources = new HashSet<>();

    @Value("${spring.security.switch}")
    private boolean securitySwitch;

    // 根据请求的路径匹配资源
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) {
        log.info("---MySecurityMetadataSource 匹配请求路径---");
        // 该对象是Spring Security帮我们封装好的，可以通过该对象获取request等信息
        FilterInvocation filterInvocation = (FilterInvocation) object;
        HttpServletRequest request = filterInvocation.getRequest();
        ////如果验证开关不开启直接放行
        //if (!securitySwitch) {
        //  return null;
        //}
        // 遍历所有权限资源，以和当前请求所需的权限进行匹配
        for (Resource resource : resources) {
            String method = resource.getMethod();
            AntPathRequestMatcher ant = new AntPathRequestMatcher(resource.getPath());
            // 如果请求方法和请求路径都匹配上了，则代表找到了这个请求所需的授权规则
            if (request.getMethod().equals(method) && ant.matches(request)) {
                // 将我们权限资源id返回
                return Collections.singletonList(new SecurityConfig(resource.getPath()));
            }
        }
        // 走到这里就代表该请求无需授权即可访问，返回空
        return null;
    }

    public static Long getResourceId(String path) {
        Set<Resource> set = getResources();
        for (Resource resource : set) {
            if (resource.getPath().equals(path)) {
                return resource.getResourceId();
            }
        }
        return null;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }
}

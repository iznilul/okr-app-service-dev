package com.itlab.blog.security;

import com.alibaba.fastjson.JSON;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.utils.Result;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-21 00:20
 */
@Slf4j
@Component
public class ApiFilter implements Filter {

    @Getter
    @Setter
    private static Set<Resource> resources = new HashSet<>();

    @Override
    public void init(FilterConfig arg0) {
        // System.out.println("----Filter初始化----");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {
        log.info("----ApiFilter 接口过滤器----");
        int flag = 0;
        String path = ((HttpServletRequest) request).getRequestURI();
        log.info("请求路径{}", path);
        for (Resource resource : resources) {
            if (resource.getPath().equals(path)) {
                if (resource.getStatus() == 1) {
                    filterChain.doFilter(request, response); // 执行目标资源，放行
                } else {
                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    //封装一个结果返回类
                    out.write(JSON.toJSONString(Result.failure("接口暂时关闭")));
                    out.flush();
                    out.close();
                }
                flag = 1;
                break;
            }
        }
        if (flag == 0) {
            log.info("----ApiFilter 没有找到对应接口----");
            //若没有找到请求接口，返回错误
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.write(JSON.toJSONString(Result.failure("请求接口不存在")));
            out.flush();
            out.close();
        }
    }

    @Override
    public void destroy() {
        // System.out.println("----Filter销毁----");
    }

    public static void updateResources(long resourceId) {
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

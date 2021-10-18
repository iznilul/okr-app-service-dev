package com.softlab.okr.config;

import cn.hutool.core.util.ReUtil;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: zhangbo
 * @description: 启动时加载不需要权限控制的接口
 * @date: 2021/9/17 17:53
 * @version: 1.0
 */
@Slf4j
@Component
public class LoaderSkipAuthURIApplication implements ApplicationContextAware {

  private static final String PATH_VARIABLE_REGEX = "\\{\\w{1,}\\}";
  private static final Set<String> whiteUrls = new HashSet<>();

  public static Set<String> getWhiteUrls() {
    return whiteUrls;
  }

  @Override
  public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

    Map<String, Object> restControllerMap = applicationContext
        .getBeansWithAnnotation(RestController.class);
    Map<String, Object> controllerMap = applicationContext.getBeansWithAnnotation(Controller.class);

    whiteUrls.addAll(getWhiteUrl(restControllerMap));
    whiteUrls.addAll(getWhiteUrl(controllerMap));

    whiteUrls.forEach(url -> log.info("[权限白名单接口]: {}", url));

  }


  public Set<String> getWhiteUrl(Map<String, Object> controllerMap) {
    Set<String> skipUrlSet = new HashSet<>();
    for (Object controller : controllerMap.values()) {
      Class<?> controllerClass = AopUtils.getTargetClass(controller);
      RequestMapping mapping = controllerClass.getAnnotation(RequestMapping.class);
      SkipAuth annotation = controllerClass.getAnnotation(SkipAuth.class);

      String classUrl = mapping == null ? "" : mapping.value()[0];
      boolean skipAllMethod = (annotation == null) ? Boolean.FALSE : Boolean.TRUE;

      getNeedCheckMethod(controllerClass).forEach(method -> {
        String methodUrl = getMethodRequestUrl(method);
        if (StringUtils.isNotBlank(methodUrl)) {
          if (skipAllMethod) {
            skipUrlSet.add(buildUrl(classUrl, methodUrl));
          } else {
            if (method.getAnnotation(SkipAuth.class) != null) {
              skipUrlSet.add(buildUrl(classUrl, methodUrl));
            }
          }
        }
      });
    }
    return skipUrlSet;
  }

  private List<Method> getNeedCheckMethod(Class<?> targetClass) {
    return Arrays.stream(targetClass.getMethods())
        .filter(method -> method.getAnnotation(RequestMapping.class) != null
            || method.getAnnotation(GetMapping.class) != null
            || method.getAnnotation(PostMapping.class) != null).collect(Collectors.toList());
  }


  private String buildUrl(String classUrl, String methodUrl) {
    if (classUrl.endsWith("/")) {
      classUrl = methodUrl.substring(1);
    }
    if (!methodUrl.startsWith("/")) {
      methodUrl = "/" + methodUrl;
    }
    methodUrl = ReUtil.replaceAll(methodUrl, PATH_VARIABLE_REGEX, "*");
    return classUrl + methodUrl;
  }

  private String getMethodRequestUrl(Method method) {
    Annotation[] annotations = method.getAnnotations();
    String uri = null;
    for (Annotation annotation : annotations) {
      String[] value = null;
      if (annotation instanceof RequestMapping) {
        value = ((RequestMapping) annotation).value();
      } else if (annotation instanceof GetMapping) {
        value = ((GetMapping) annotation).value();
      } else if (annotation instanceof PostMapping) {
        value = ((PostMapping) annotation).value();
      }
      if (value != null && value.length > 0) {
        uri = value[0];
      }
    }
    return uri;
  }

}

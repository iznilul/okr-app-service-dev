package com.softlab.okr.config;

/**
 * @Author: Devhui
 * @Date: 2019-12-05 20:44
 * @Version 1.0
 */

//@Configuration
//public class WebMvcConfig implements WebMvcConfigurer {
//
//    @Autowired
//    private MainInterceptor mainInterceptor;

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        // 多个拦截器组成一个拦截器链
//        // addPathPatterns 用于添加拦截规则，/**表示拦截所有请求
//        // excludePathPatterns 用户排除拦截
//        // ****注意前面别掉了斜杠****
//
//        registry.addInterceptor(mainInterceptor).addPathPatterns("/**")
//                .excludePathPatterns("/user/login", "/user/standing", "/contest/all", "/user/feedback"
//                        , "/user/notice", "/login/login", "/train/topiclist")
//                .excludePathPatterns("/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html/**", "/hello");
//    }
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        //将templates目录下的CSS、JS文件映射为静态资源，防止Spring把这些资源识别成thymeleaf模版
//        registry.addResourceHandler("/templates/**.js").addResourceLocations("classpath:/templates/");
//        registry.addResourceHandler("/templates/**.css").addResourceLocations("classpath:/templates/");
//        //其他静态资源
//        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
//        //swagger增加url映射
//        registry.addResourceHandler("swagger-ui.html")
//                .addResourceLocations("classpath:/META-INF/resources/");
//        registry.addResourceHandler("/webjars/**")
//                .addResourceLocations("classpath:/META-INF/resources/webjars/");
//    }
//}

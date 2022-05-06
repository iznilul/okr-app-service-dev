package com.itlab.blog.utils;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 19:25
 **/
@Configuration
@ConfigurationProperties(prefix = "swagger")
@PropertySource(value = {"classpath:swagger/swagger.properties"}, encoding = "gbk")
@Data
public class SwaggerInfo {
    private String basePackage;
    private String title;
    private String description;
    private String version;
    private Boolean enable;
    private String contactName;
    private String contactEmail;
    private String contactUrl;
    private String license;
    private String licenseUrl;
}
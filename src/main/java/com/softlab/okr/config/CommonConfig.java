package com.softlab.okr.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 14:10
 **/
@Configuration
@ConfigurationProperties(prefix = "signup")
@PropertySource(value = {"classpath:common/common.properties"}, encoding = "gbk")
@Data
public class CommonConfig {

  private String qqGroupNumber;
}

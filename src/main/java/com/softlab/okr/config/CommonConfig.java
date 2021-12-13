package com.softlab.okr.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @program: okr
 * @description:
 * @author: lulinzi
 * @create: 2021-08-20 14:10
 **/
@Configuration
@Data
public class CommonConfig {

    @Value("${signup.qq-group-number}")
    private String qqGroupNumber;
}

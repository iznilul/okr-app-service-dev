package com.itlab.blog.config;

import com.itlab.blog.utils.SwaggerInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.core.env.Profiles;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Author: Devhui @Date: 2020/3/8 11:00 @Email: devhui@ihui.ink @Version: 1.0
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig {

  @Autowired
  SwaggerInfo swaggerInfo;

  @Bean
  public Docket createRestApi(Environment environment) {
    Profiles profiles = Profiles.of("dev");
    boolean flag = environment.acceptsProfiles(profiles);
    // System.out.println("swagger" + flag);
    return new Docket(DocumentationType.SWAGGER_2)
        .pathMapping("/")
        .select()
        .apis(RequestHandlerSelectors.basePackage("com.itlab.blog.controller"))
        .paths(PathSelectors.any())
        .build()
        .apiInfo(this.apiInfo())
        .enable(flag);
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder()
        .title(swaggerInfo.getTitle())
        .description(swaggerInfo.getDescription())
        .version(swaggerInfo.getVersion())
        .contact(
            new Contact(
                swaggerInfo.getContactName(),
                swaggerInfo.getContactUrl(),
                swaggerInfo.getContactEmail()))
        .license(swaggerInfo.getLicense())
        .licenseUrl(swaggerInfo.getLicenseUrl())
        .build();
  }
}

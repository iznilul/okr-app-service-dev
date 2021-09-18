package com.softlab.okr.config;

/**
 *
 */
//@Configuration
//@MapperScan("com.softlab.okr.dao.mapper")
//public class MybatisPlusConfig {
//
//  /**
//   * 新的分页插件,一缓和二缓遵循mybatis的规则,需要设置 MybatisConfiguration#useDeprecatedExecutor = false
//   * 避免缓存出现问题(该属性会在旧插件移除后一同移除)
//   */
//  @Bean
//  public MybatisPlusInterceptor mybatisPlusInterceptor() {
//    MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
//    interceptor.addInnerInterceptor(new PaginationInnerInterceptor());
//    return interceptor;
//  }
//
//  @Bean
//  public ConfigurationCustomizer configurationCustomizer() {
//    return configuration -> configuration.setUseDeprecatedExecutor(false);
//  }
//
//
//}

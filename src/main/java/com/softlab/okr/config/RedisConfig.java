package com.softlab.okr.config;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-24 22:03
 **/
//@Configuration
//public class RedisConfig {
//
//  @Value("${spring.redis.host}")
//  private String redisHost;
//
//  @Value("${spring.redis.port}")
//  private int redisPort;
//
//  @Value("${spring.redis.password}")
//  private String password;
//
//  @Bean(destroyMethod = "shutdown")
//  public ClientResources clientResources() {
//    return DefaultClientResources.create();
//  }
//
//  @Bean
//  public RedisStandaloneConfiguration redisStandaloneConfiguration() {
//    RedisStandaloneConfiguration redisStandaloneConfiguration =
//        new RedisStandaloneConfiguration(redisHost, redisPort);
//    if (password != null && !password.trim().equals("")) {
//      RedisPassword redisPassword = RedisPassword.of(password);
//      redisStandaloneConfiguration.setPassword(redisPassword);
//    }
//    return redisStandaloneConfiguration;
//  }
//
//  @Bean
//  @ConditionalOnMissingBean(name = "redisTemplate")
//  @Primary
//  public RedisTemplate<String, Object> redisTemplate(
//      RedisConnectionFactory redisConnectionFactory) {
//    RedisTemplate<String, Object> template = new RedisTemplate<>();
//    template.setConnectionFactory(redisConnectionFactory);
//    RedisSerializer<String> redisSerializer = new StringRedisSerializer();
//    FastJsonRedisSerializer<Object> fastJsonRedisSerializer = new FastJsonRedisSerializer<>(
//        Object.class);
//    template.setKeySerializer(redisSerializer);
//    template.setHashKeySerializer(redisSerializer);
//    template.setHashValueSerializer(fastJsonRedisSerializer);
//    template.setValueSerializer(fastJsonRedisSerializer);
//    return template;
//  }
//
//}


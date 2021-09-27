package com.softlab.okr.config;

import com.alibaba.fastjson.support.spring.FastJsonRedisSerializer;
import io.lettuce.core.resource.ClientResources;
import io.lettuce.core.resource.DefaultClientResources;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisPassword;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-24 22:03
 **/
@Configuration
public class RedisConfig {

  @Value("${spring.redis.host}")
  private String redisHost;

  @Value("${spring.redis.port}")
  private int redisPort;

  @Value("${spring.redis.password}")
  private String password;

  //@Value("${redis.taskScheduler.poolSize}")
  //private int tasksPoolSize;
  //
  //@Value("${redis.taskScheduler.defaultLockMaxDurationMinutes}")
  //private int lockMaxDuration;

  @Bean(destroyMethod = "shutdown")
  public ClientResources clientResources() {
    return DefaultClientResources.create();
  }

  @Bean
  public RedisStandaloneConfiguration redisStandaloneConfiguration() {
    RedisStandaloneConfiguration redisStandaloneConfiguration =
        new RedisStandaloneConfiguration(redisHost, redisPort);
    if (password != null && !password.trim().equals("")) {
      RedisPassword redisPassword = RedisPassword.of(password);
      redisStandaloneConfiguration.setPassword(redisPassword);
    }
    return redisStandaloneConfiguration;
  }

  @Bean
  @ConditionalOnMissingBean(name = "redisTemplate")
  @Primary
  public RedisTemplate<String, Object> redisTemplate(
      RedisConnectionFactory redisConnectionFactory) {
    RedisTemplate<String, Object> template = new RedisTemplate<>();
    template.setConnectionFactory(redisConnectionFactory);
    RedisSerializer<String> redisSerializer = new StringRedisSerializer();
    FastJsonRedisSerializer<Object> fastJsonRedisSerializer = new FastJsonRedisSerializer<>(
        Object.class);
    template.setKeySerializer(redisSerializer);
    template.setHashKeySerializer(redisSerializer);
    template.setHashValueSerializer(fastJsonRedisSerializer);
    template.setValueSerializer(fastJsonRedisSerializer);
    return template;
  }

  //@Bean
  //public ClientOptions clientOptions() {
  //  return ClientOptions.builder()
  //      .disconnectedBehavior(DisconnectedBehavior.REJECT_COMMANDS)
  //      .autoReconnect(true).build();
  //}
  //
  //@Bean
  //LettucePoolingClientConfiguration lettucePoolConfig(ClientOptions options,
  //    ClientResources dcr) {
  //  return LettucePoolingClientConfiguration.builder().poolConfig(new GenericObjectPoolConfig())
  //      .clientOptions(options).clientResources(dcr).build();
  //}
  //
  //@Bean
  //public RedisConnectionFactory connectionFactory(
  //    RedisStandaloneConfiguration redisStandaloneConfiguration,
  //    LettucePoolingClientConfiguration lettucePoolConfig) {
  //  return new LettuceConnectionFactory(redisStandaloneConfiguration, lettucePoolConfig);
  //}
  //
  ////分布式锁调度
  //@Bean
  //public LockProvider lockProvider(RedisConnectionFactory connectionFactory) {
  //  return new RedisLockProvider(connectionFactory);
  //}
  //
  //@Bean
  //public ScheduledLockConfiguration taskSchedulerLocker(LockProvider lockProvider) {
  //  return ScheduledLockConfigurationBuilder.withLockProvider(lockProvider)
  //      .withPoolSize(tasksPoolSize).withDefaultLockAtMostFor(Duration.ofMinutes(lockMaxDuration))
  //      .build();
  //}

}


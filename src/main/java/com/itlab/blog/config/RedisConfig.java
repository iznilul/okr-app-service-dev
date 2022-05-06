package com.itlab.blog.config;

import cn.hutool.crypto.SecureUtil;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.model.enums.CacheKeyUnitEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.utils.JsonUtil;
import com.itlab.blog.utils.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCache;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.time.Duration;
import java.util.Arrays;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-24 22:03
 **/
@Slf4j
@EnableCaching
@Configuration
public class RedisConfig {

    @Bean
    public <T> RedisTemplate<String, T> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, T> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(factory);
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(valueSerializer());
        redisTemplate.setHashKeySerializer(new StringRedisSerializer());
        redisTemplate.setHashValueSerializer(valueSerializer());
        redisTemplate.afterPropertiesSet();
        return redisTemplate;
    }

    @Bean
    public RedisCacheManager redisCacheManager(RedisConnectionFactory factory) {
        RedisCacheWriter redisCacheWriter = RedisCacheWriter.nonLockingRedisCacheWriter(factory);
        RedisCacheConfiguration redisCacheConfiguration = RedisCacheConfiguration.defaultCacheConfig()
                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(new StringRedisSerializer()))
                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(valueSerializer()));
        return new CustomRedisCacheManager(redisCacheWriter, redisCacheConfiguration);
    }

    @Bean(name = EntityNames.MD5_KEY_GENERATOR)
    public KeyGenerator keyGenerator() {
        return (target, method, params) -> {
            String userName = SecurityUtil.getUsername();
            String methodName = method.getName();
            String json = JsonUtil.toJsonString(Arrays.asList(params));
            String key = userName + "_" + methodName + "_" + SecureUtil.md5(json);
            log.info("生成缓存key:{}", key);
            return key;
        };
    }

    private RedisSerializer<Object> valueSerializer() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.activateDefaultTyping(LaissezFaireSubTypeValidator.instance, ObjectMapper.DefaultTyping.NON_FINAL);
        mapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        Jackson2JsonRedisSerializer redisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        redisSerializer.setObjectMapper(mapper);
        //GenericJackson2JsonRedisSerializer redisSerializer = new GenericJackson2JsonRedisSerializer();
        return redisSerializer;
    }

    static class CustomRedisCacheManager extends RedisCacheManager {
        /**
         * {cacheName}#{ttl}{d/h/m/s}
         */
        @Override
        protected RedisCache createRedisCache(String name, RedisCacheConfiguration configuration) {
            String[] split = name.split("#");
            if (split.length == 1) {
                //没有设置过期值
                return super.createRedisCache(name, configuration);
            }
            Duration duration = buildCacheKeyTtl(split[1]);
            return super.createRedisCache(split[0], configuration.entryTtl(duration));
        }

        public CustomRedisCacheManager(RedisCacheWriter writer, RedisCacheConfiguration configuration) {
            super(writer, configuration);
        }

        public Duration buildCacheKeyTtl(String ttlParam) {
            //单位
            String unit;
            //过期时间
            int ttl;
            try {
                //判断最后一位是否为数字
                String lastChar = ttlParam.substring(ttlParam.length() - 1);
                if (StringUtils.isNumeric(lastChar)) {
                    ttl = Integer.parseInt(ttlParam);
                    unit = String.valueOf(CacheKeyUnitEnum.SECOND.getCode());
                } else {
                    ttl = Integer.parseInt(ttlParam.substring(0, ttlParam.length() - 1));
                    unit = lastChar;
                }
            } catch (Exception e) {
                log.error("cache key expire param set error. ttl:{}", ttlParam, e);
                throw new BusinessException("缓存参数配置异常");
            }

            if (CacheKeyUnitEnum.HOUR.getCode().equals(unit)) {
                return Duration.ofHours(ttl);
            } else if (CacheKeyUnitEnum.MINUTE.getCode().equals(unit)) {
                return Duration.ofMinutes(ttl);
            } else if (CacheKeyUnitEnum.SECOND.getCode().equals(unit)) {
                return Duration.ofSeconds(ttl);
            } else if (CacheKeyUnitEnum.DAY.getCode().equals(unit)) {
                return Duration.ofDays(ttl);
            }
            return Duration.ofSeconds(ttl);
        }
    }
}


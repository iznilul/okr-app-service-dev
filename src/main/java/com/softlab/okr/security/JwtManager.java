package com.softlab.okr.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Duration;
import java.util.Date;

/**
 * JWT工具类
 *
 * @author RudeCrab
 */
@Slf4j
@Component
public class JwtManager {

    @Value("${security.jwt.secretKey}")
    private String secretKey;
    /**
     * 过期时间目前设置成2天，这个配置随业务需求而定
     */
    private Duration expiration = Duration.ofDays(365);

    /**
     * 生成JWT
     *
     * @param username 用户名
     * @return JWT
     */
    public String generate(String username) {
        // 过期时间
        Date expiryDate = new Date(System.currentTimeMillis() + expiration.toMillis());

        return Jwts.builder()//Jwt三部分
                .setSubject(username) // 将用户名放进JWT
                .setIssuedAt(new Date()) // 设置JWT签发时间
                .setExpiration(expiryDate)  // 设置过期时间
                .signWith(SignatureAlgorithm.HS512, secretKey) // 设置加密算法和秘钥
                .compact();
    }

    /**
     * 解析JWT
     *
     * @param token JWT字符串
     * @return 解析成功返回Claims对象，解析失败返回null
     */
    public Claims parse(HttpServletRequest request, HttpServletResponse response, String token)
            throws IOException, ServletException {
        // 如果是空字符串直接返回null
        if (!StringUtils.hasLength(token)) {
            return null;
        }

        Claims claims = null;
        // 解析失败了会抛出异常，所以我们要捕捉一下。token过期、token非法都会导致解析失败
        try {
            claims = Jwts.parser()
                    .setSigningKey(secretKey)
                    .parseClaimsJws(token)
                    .getBody();
        } catch (ExpiredJwtException e) {
            log.error("token过期或者不合法:{}", e
                    .toString());
            request.setAttribute("filter.error", e);
            request.getRequestDispatcher("/error/throw").forward(request, response);
        }
        return claims;
    }
}

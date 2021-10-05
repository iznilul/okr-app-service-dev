package com.softlab.okr.security;

import com.softlab.okr.entity.UserEntity;
import java.util.Collection;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 * 自定义用户对象
 *
 * @author RudeCrab
 */
@Getter
@ToString
@EqualsAndHashCode(callSuper = false)
public class UserDetail extends User {
    /**
     * 我们自己的用户实体对象，这里省略掉get/set方法
     */
    private UserEntity userEntity;

    public UserDetail(UserEntity userEntity, Collection<? extends GrantedAuthority> authorities) {
        // 必须调用父类的构造方法，初始化用户名、密码、权限
        super(userEntity.getUsername(), userEntity.getPassword(), authorities);
        this.userEntity = userEntity;
    }

    @Override
    public String getPassword() {
        return this.userEntity.getPassword();
    }

    @Override
    public String getUsername() {
        return this.userEntity.getUsername();
    }

    public Integer getUserId() {
        return this.userEntity.getUserId();
    }
}

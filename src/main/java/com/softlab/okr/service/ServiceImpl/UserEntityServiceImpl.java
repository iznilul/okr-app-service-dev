package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.exception.ControllerException;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.mapper.UserEntityMapper;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.JwtManager;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.ResultCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author RudeCrab
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserEntityServiceImpl implements UserEntityService,
        UserDetailsService {
    @Autowired
    private JwtManager jwtManager;

    @Autowired
    private UserEntityMapper userEntityMapper;

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //登录操作
    @Override
    public UserVO login(LoginDTO loginDTO) {
        // 根据用户名查询出用户实体对象
        UserEntity user = userEntityMapper.selectByUsername(loginDTO.getUsername());
        // 若没有查到用户或者密码校验失败则抛出异常，将未加密的密码和已加密的密码进行比对
        if (user == null || !passwordEncoder.matches(loginDTO.getPassword(), user.getPassword())) {
            throw new ControllerException(ResultCode.USER_LOGIN_ERROR);
        }
        //VO是返回给前端用户展示的实体类，不过可以统一包装返回类
        UserVO userVO = new UserVO();
        userVO.setUserId(user.getUserId())
                .setUsername(user.getUsername())
                // 生成token
                .setToken(jwtManager.generate(user.getUsername()))//用jwt生成token
                .setResourceIds(resourceMapper.selectByUserId(user.getUserId()));
        return userVO;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        // 先调用DAO层查询用户实体对象
        UserEntity user = userEntityMapper.selectByUsername(username);
        // 若没查询到一定要抛出该异常，这样才能被Spring Security的错误处理器处理
        if (user == null) {
            throw new UsernameNotFoundException("没有找到该用户");
        }
//        // 查询权限id
        Set<SimpleGrantedAuthority> authorities = resourceMapper.selectByUserId(user.getUserId())
                .stream()
                .map(String::valueOf)
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toSet());
        return new UserDetail(user, authorities);
    }

    @Override
    public UserEntity getByUsername(String username) {
        return userEntityMapper.selectByUsername(username);
    }

    @Override
    public int register(RegisterBo registerBo) {
        return userEntityMapper.register(registerBo);
    }

    @Override
    public void removeByUsername(String username) {
        userEntityMapper.deleteByUsername(username);
    }
}

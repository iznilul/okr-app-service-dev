package com.softlab.okr.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.TimeFormat;
import com.softlab.okr.entity.Role;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.UserEntityMapper;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.ModifyPwdDTO;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.vo.UserEntityVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.security.JwtManager;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.*;
import com.softlab.okr.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author RudeCrab
 */
@Service
public class UserEntityServiceImpl extends ServiceImpl<UserEntityMapper, UserEntity> implements
        IUserEntityService,
        UserDetailsService {

    @Autowired
    private JwtManager jwtManager;

    @Autowired
    private UserEntityMapper userEntityMapper;

    @Autowired
    private IResourceService resourceService;

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private IUserRoleService userRoleService;

    @Autowired
    private IUserEntityService userEntityService;

    @Autowired
    private IAuthenticationService authenticationService;

    //登录操作
    @Override
    public UserEntityVO login(LoginDTO dto) {
        // 根据用户名查询出用户实体对象
        UserEntity userEntity = userEntityService.getByUsername(dto.getUsername());
        if (!loginCheck(userEntity, dto.getPassword())) {
            return null;
        } else {
            //VO是返回给前端用户展示的实体类，不过可以统一包装返回类
            UserEntityVO userEntityVO = new UserEntityVO();
            userEntityVO.setUserId(userEntity.getUserId())
                    .setUsername(userEntity.getUsername())
                    .setToken(jwtManager.generate(userEntity.getUsername()));
            return userEntityVO;
        }
    }


    @Override
    public UserDetails loadUserByUsername(String username) {
        // 先调用DAO层查询用户实体对象
        UserEntity user = userEntityMapper.selectOne(new QueryWrapper<UserEntity>()
                .eq("username", username));
        // 若没查询到一定要抛出该异常，这样才能被Spring Security的错误处理器处理
        if (user == null) {
            throw new UsernameNotFoundException("没有找到该用户");
        }
        // 查询权限id
        Set<SimpleGrantedAuthority> authorities = resourceService.getResourceByUserId(user.getUserId())
                .stream()
//                .map(String::valueOf)
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toSet());
        return new UserDetail(user, authorities);
    }

    @Override
    public UserEntity getByUsername(String username) {
        return userEntityMapper.selectOne(new QueryWrapper<UserEntity>()
                .eq("username", username));
    }

    @Override
    @Transactional
    public boolean register(RegisterDTO dto) {
        if (null != this.getByUsername(dto.getUsername())) {
            return false;
        } else {
            String password = MD5Util.string2MD5(dto.getUsername());
            UserEntity userEntity = new UserEntity(null, dto.getUsername(), password);

            if (userEntityMapper.insert(userEntity) == 0) {
                return false;
            } else {
                int roleId = roleService.getOne(new QueryWrapper<Role>().eq("name", dto.getName()))
                        .getRoleId();
                int userId = userEntity.getUserId();
                UserRole userRole = new UserRole(null, userId, roleId, DateUtil.parse(TimeFormat.neverExpire), null);
                return userInfoService.saveUserInfo(userId, dto.getUsername()) == 1 && userRoleService.save(userRole);
            }
        }
    }

    @Override
    @Transactional
    public boolean removeByUsername(String username) {
        UserEntity entity = this.getByUsername(username);
        if (null == entity) {
            return false;
        } else {
            Integer userId = entity.getUserId();
            return userEntityMapper.deleteByUsername(username) == 1
                    && userInfoService.removeById(userId)
                    && userRoleService.remove(new QueryWrapper<UserRole>().eq("user_id", userId));
        }
    }

    @Override
    public boolean modifyPassword(ModifyPwdDTO dto) {
        String username = authenticationService.getUsername();
        UserEntity userEntity = userEntityService.getByUsername(username);

        if (loginCheck(userEntity, dto.getOldPassword())) {
            userEntity.setPassword(dto.getNewPassword());
            return this.updateById(userEntity);
        } else {
            return false;
        }
    }

    private boolean loginCheck(Map<String, Object> map, String password) {
        // 若没有查到用户或者密码校验失败则抛出异常，将未加密的密码和已加密的密码进行比对
        String s = (String) map.get("password");
        return map.size() != 0 && s.equals(password);
    }

    private boolean loginCheck(UserEntity userEntity, String password) {
        // 若没有查到用户或者密码校验失败则抛出异常，将未加密的密码和已加密的密码进行比对
        return userEntity != null && userEntity.getPassword().equals(password);
    }
}

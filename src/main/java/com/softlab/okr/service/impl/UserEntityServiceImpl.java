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

    //????????????
    @Override
    public UserEntityVO login(LoginDTO dto) {
        // ??????????????????????????????????????????
        UserEntity userEntity = userEntityService.getByUsername(dto.getUsername());
        if (!loginCheck(userEntity, dto.getPassword())) {
            return null;
        } else {
            //VO??????????????????????????????????????????????????????????????????????????????
            UserEntityVO userEntityVO = new UserEntityVO();
            userEntityVO.setUserId(userEntity.getUserId())
                    .setUsername(userEntity.getUsername())
                    .setToken(jwtManager.generate(userEntity.getUsername()));
            return userEntityVO;
        }
    }


    @Override
    public UserDetails loadUserByUsername(String username) {
        // ?????????DAO???????????????????????????
        UserEntity user = userEntityMapper.selectOne(new QueryWrapper<UserEntity>()
                .eq("username", username));
        // ?????????????????????????????????????????????????????????Spring Security????????????????????????
        if (user == null) {
            throw new UsernameNotFoundException("?????????????????????");
        }
        // ????????????id
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
        // ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        String s = (String) map.get("password");
        return map.size() != 0 && s.equals(password);
    }

    private boolean loginCheck(UserEntity userEntity, String password) {
        // ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        return userEntity != null && userEntity.getPassword().equals(password);
    }
}

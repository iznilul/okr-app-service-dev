package com.softlab.okr.service.impl;

import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.mapper.RoleMapper;
import com.softlab.okr.mapper.UserEntityMapper;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.enums.statusCode.RoleStatus;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.JwtManager;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.ResourceService;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.MD5Util;
import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author RudeCrab
 */
@Service
public class UserEntityServiceImpl implements UserEntityService,
    UserDetailsService {

  @Autowired
  private JwtManager jwtManager;

  @Autowired
  private UserEntityMapper userEntityMapper;

  @Autowired
  private ResourceMapper resourceMapper;

  @Autowired
  private ResourceService resourceService;

  @Autowired
  private RoleMapper roleMapper;

  @Autowired
  private UserInfoMapper userInfoMapper;

  //登录操作
  @Override
  public UserVO login(UserEntity userEntity) {

    //VO是返回给前端用户展示的实体类，不过可以统一包装返回类
    UserVO userVO = new UserVO();
    userVO.setUserId(userEntity.getUserId())
        .setUsername(userEntity.getUsername())
        // 生成token
        .setToken(jwtManager.generate(userEntity.getUsername()))//用jwt生成token
        .setResourceIds(resourceMapper.selectByUserId(userEntity.getUserId()));
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
    // 查询权限id
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
  @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class, readOnly = false)
  public void register(RegisterDTO dto) {

    String password = MD5Util.string2MD5(dto.getUsername());
    int roleId = roleMapper.selectByName(dto.getName()).getRoleId();

    RoleResourceBo roleResourceBo =
        new RoleResourceBo(roleId,
            resourceService.getResourceIds(RoleStatus.getRole(dto.getName())));

    RegisterBo bo = new RegisterBo(null, dto.getUsername(), password);

    userEntityMapper.register(bo);
    roleMapper.insertUserRole(bo.getUserId(), roleId);
    userInfoMapper.insertUserInfo(bo.getUserId(), bo.getUsername());
  }

  @Override
  public void removeByUsername(String username) {
    userEntityMapper.deleteByUsername(username);
  }
}

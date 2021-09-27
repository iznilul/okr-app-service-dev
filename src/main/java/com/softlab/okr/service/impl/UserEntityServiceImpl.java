package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Role;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.UserEntityMapper;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.vo.UserVO;
import com.softlab.okr.security.JwtManager;
import com.softlab.okr.security.UserDetail;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IRoleService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
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

  //登录操作
  @Override
  public UserVO login(UserEntity userEntity) {

    //VO是返回给前端用户展示的实体类，不过可以统一包装返回类
    UserVO userVO = new UserVO();
    userVO.setUserId(userEntity.getUserId())
        .setUsername(userEntity.getUsername())
        // 生成token
        .setToken(jwtManager.generate(userEntity.getUsername()))//用jwt生成token
        .setResourceIds(resourceService.getResourceByUserId(userEntity.getUserId()));
    return userVO;
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
        .map(String::valueOf)
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
  @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public int register(RegisterDTO dto) {
    if (null != this.getByUsername(dto.getUsername())) {
      return 0;
    } else {
      String password = MD5Util.string2MD5(dto.getUsername());
      UserEntity userEntity = new UserEntity(null, dto.getUsername(), password);
      int userId = userEntityMapper.insert(userEntity);
      if (userId == 0) {
        return 0;
      } else {
        int roleId = roleService.getOne(new QueryWrapper<Role>().eq("name", dto.getName()))
            .getRoleId();
        UserRole userRole = new UserRole(null, userId, roleId);
        return userInfoService.saveUserInfo(userId, dto.getUsername());
      }
    }
  }

  @Override
  public int removeByUsername(String username) {
    return userEntityMapper.deleteByUsername(username);
  }
}

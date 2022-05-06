package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.entity.Role;
import com.itlab.blog.mapper.RoleMapper;
import com.itlab.blog.service.IRoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}

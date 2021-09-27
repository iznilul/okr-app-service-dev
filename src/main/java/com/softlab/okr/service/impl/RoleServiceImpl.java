package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Role;
import com.softlab.okr.mapper.RoleMapper;
import com.softlab.okr.service.IRoleService;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements
    IRoleService {

}

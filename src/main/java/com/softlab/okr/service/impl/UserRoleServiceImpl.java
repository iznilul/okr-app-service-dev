package com.softlab.okr.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.TimeFormat;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.UserRoleMapper;
import com.softlab.okr.model.dto.GrantRoleDTO;
import com.softlab.okr.model.enums.statusCode.RoleStatus;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.IUserRoleService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 用户-角色关系表 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Override
    public Boolean grantRole(GrantRoleDTO dto) {
        String message = dto.getRoleMessage();
        Integer userId = dto.getUserId();
        Integer roleId = RoleStatus.getCode(message);
        if (null == message || null == userId || null == roleId) {
            throw new BusinessException();
        }
        Date date = dto.getDate();
        Boolean flag = dto.getFlag();
        if (flag) {
            date = DateUtil.parse(TimeFormat.neverExpire);
        }
        UserRole userRole = this.getOne(new QueryWrapper<UserRole>()
                .eq("user_id", userId).eq("role_id", roleId));
        userRole.setExpireTime(date);
        return this.updateById(userRole);
    }

}

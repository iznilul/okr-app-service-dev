package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.entity.UserRole;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.dto.UpdateUserRoleDTO;
import com.softlab.okr.model.enums.RoleEnum;
import com.softlab.okr.model.enums.UserStatusEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.model.vo.UserRoleVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.service.IUserRoleService;
import com.softlab.okr.utils.CopyUtil;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements
        IUserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private IUserRoleService userRoleService;

    @Autowired
    private IAuthenticationService authenticationService;

    @Override
    public int saveUserInfo(int userId, String username) {
        UserInfo userInfo = new UserInfo(userId, username, null, null, null, null, null, null, null, 0, null, null);
        return userInfoMapper.insert(userInfo);
    }

    @Override
    public UserInfo getUserInfo() {
        String username = authenticationService.getUsername();
        UserInfo userInfo = userInfoMapper.selectUserInfoByUsername(username);
        userInfo.setRole(RoleEnum.getRole(userInfo.getRoleId()));
        return userInfo;
    }

    @Override
    public UserRoleVO getUserRole(String username) {
        UserInfoVO userInfoVO = this.getUserInfoByUsername(username);
        if (null == userInfoVO) {
            return null;
        }
        return CopyUtil.copy(userInfoVO, UserRoleVO.class);
    }

    @Override
    public UserInfoVO getUserInfoByUsername(String username) {
        UserInfoVO vo = userInfoMapper.selectUserInfoVOByUsername(username);
        vo.setRole(RoleEnum.getMessage(vo.getRoleId()));
        vo.setStatusName(UserStatusEnum.getMessage(vo.getStatus()));
        return vo;
    }

    @Override
    public Result getUserInfoByCond(SelectUserDTO dto) {
        Page<UserInfo> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<UserInfoVO> voPage = userInfoMapper.selectUserInfoVOList(page, dto);
        voPage.getRecords().forEach(vo -> {
            vo.setRole(RoleEnum.getMessage(vo.getRoleId()));
            vo.setStatusName(UserStatusEnum.getMessage(vo.getStatus()));
        });
        return Result
                .success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @Override
    public void modifyUserInfo(UpdateUserDTO dto) {
        UserInfo userInfo = this.getOne(new QueryWrapper<UserInfo>().eq("username", dto.getUsername()));
        if (null == userInfo) {
            throw new BusinessException("??????????????????");
        } else {
            userInfo.setName(dto.getName()).setMajor(dto.getMajor()).setQq(dto.getQq()).setPhone(dto.getPhone())
                    .setWeixin(dto.getWeixin()).setProfile(dto.getProfile());
            userInfoMapper.updateById(userInfo);
        }
    }

    @Override
    @Transactional
    public void modifyUserRole(UpdateUserRoleDTO dto) {
        UserInfo userInfo = this.getOne(new QueryWrapper<UserInfo>().eq("username", dto.getUsername()));
        if (null == userInfo) {
            throw new BusinessException("??????????????????");
        }
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>().eq("user_id", userInfo.getUserId()));
        if (null == userRole) {
            throw new BusinessException("??????????????????????????????????????????????????????");
        }
        userInfo.setStatus(UserStatusEnum.getCode(dto.getStatusName()));
        userRole.setRoleId(RoleEnum.getCode(dto.getRole())).setExpireTime(dto.getExpireTime());
        userInfoMapper.updateById(userInfo);
        userRoleService.updateById(userRole);
    }

    @Override
    public int uploadAvatar(MultipartFile file) throws IOException {
        byte[] data = file.getBytes();
        if (data.length > 1024000) {
            return 0;
        }
        // ???????????????????????????
        Base64.Encoder encoder = Base64.getEncoder();
        String avatar = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
        String username = authenticationService.getUsername();
        return userInfoMapper.update(null, new UpdateWrapper<UserInfo>()
                .eq("username", username)
                .set("avatar", avatar));
    }
}

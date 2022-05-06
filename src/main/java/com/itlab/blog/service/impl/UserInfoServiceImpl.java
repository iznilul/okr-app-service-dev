package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.entity.UserInfo;
import com.itlab.blog.entity.UserRole;
import com.itlab.blog.mapper.UserInfoMapper;
import com.itlab.blog.model.dto.SelectUserDTO;
import com.itlab.blog.model.dto.UpdateUserDTO;
import com.itlab.blog.model.dto.UpdateUserRoleDTO;
import com.itlab.blog.model.enums.RoleEnum;
import com.itlab.blog.model.enums.UserStatusEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.model.vo.UserInfoVO;
import com.itlab.blog.model.vo.UserRoleVO;
import com.itlab.blog.security.IAuthenticationService;
import com.itlab.blog.service.IUserInfoService;
import com.itlab.blog.service.IUserRoleService;
import com.itlab.blog.utils.CopyUtil;
import com.itlab.blog.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
    @CacheEvict(cacheNames = EntityNames.USER_INFO, allEntries = true)
    public void saveUserInfo(int userId, String username) {
        UserInfo userInfo = new UserInfo(userId, username, null, null, null, null, null, null,
                null, 0, null, null);
        userInfoMapper.insert(userInfo);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public UserInfo getUserInfo() {
        String username = authenticationService.getUsername();
        UserInfo userInfo = userInfoMapper.selectUserInfoByUsername(username);
        userInfo.setRole(RoleEnum.getRole(userInfo.getRoleId()));
        return userInfo;
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public UserRoleVO getUserRole(String username) {
        UserInfoVO userInfoVO = this.getUserInfoByUsername(username);
        if (null == userInfoVO) {
            return null;
        }
        return CopyUtil.copy(userInfoVO, UserRoleVO.class);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public UserInfoVO getUserInfoByUsername(String username) {
        UserInfoVO vo = userInfoMapper.selectUserInfoVOByUsername(username);
        vo.setRole(RoleEnum.getMessage(vo.getRoleId()));
        vo.setStatusName(UserStatusEnum.getMessage(vo.getStatus()));
        return vo;
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<UserInfoVO> getUserInfoByCond(SelectUserDTO dto) {
        Page<UserInfo> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<UserInfoVO> voPage = userInfoMapper.selectUserInfoVOList(page, dto);
        voPage.getRecords().forEach(vo -> {
            vo.setRole(RoleEnum.getMessage(vo.getRoleId()));
            vo.setStatusName(UserStatusEnum.getMessage(vo.getStatus()));
        });
        return voPage;
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.USER_INFO, allEntries = true)
    public void modifyUserInfo(UpdateUserDTO dto) {
        UserInfo userInfo = this.getOne(new QueryWrapper<UserInfo>().eq("username",
                dto.getUsername()));
        if (null == userInfo) {
            throw new BusinessException("没有找到用户");
        } else {
            userInfo.setName(dto.getName()).setMajor(dto.getMajor()).setQq(dto.getQq()).setPhone(dto.getPhone())
                    .setWeixin(dto.getWeixin()).setProfile(dto.getProfile());
            userInfoMapper.updateById(userInfo);
        }
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {EntityNames.USER_INFO, EntityNames.USER_ROLE}, allEntries = true)
    public void modifyUserRole(UpdateUserRoleDTO dto) {
        UserInfo userInfo = this.getOne(new QueryWrapper<UserInfo>().eq("username",
                dto.getUsername()));
        if (null == userInfo) {
            throw new BusinessException("没有找到用户");
        }
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>().eq("user_id",
                userInfo.getUserId()));
        if (null == userRole) {
            throw new BusinessException("用户权限映射关系有问题，请联系管理员");
        }
        userInfo.setStatus(UserStatusEnum.getCode(dto.getStatusName()));
        userRole.setRoleId(RoleEnum.getCode(dto.getRole())).setExpireTime(dto.getExpireTime());
        userInfoMapper.updateById(userInfo);
        userRoleService.updateById(userRole);
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.USER_INFO, allEntries = true)
    public void uploadAvatar(MultipartFile file) throws IOException {
        byte[] data = file.getBytes();
        if (data.length > 1024000) {
            throw new BusinessException("文件太大,请上传1m以内的文件");
        }
        if (!FileUtil.judgeImage(file)) {
            throw new BusinessException("需要上传图片格式的文件");
        }
        // 将字节流转成字符串
        Base64.Encoder encoder = Base64.getEncoder();
        String avatar = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
        String username = authenticationService.getUsername();
        userInfoMapper.update(null, new UpdateWrapper<UserInfo>()
                .eq("username", username)
                .set("avatar", avatar));
    }
}

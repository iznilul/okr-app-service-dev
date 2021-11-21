package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.enums.statusCode.UserInfoStatus;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import com.softlab.okr.utils.CopyUtil;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

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
    private IUserEntityService userEntityService;

    @Autowired
    private IAuthenticationService authenticationService;

    @Override
    public int saveUserInfo(int userId, String username) {
        UserInfo userInfo = new UserInfo(userId, username, null, null, null, null, null, null, null, 0);
        return userInfoMapper.insert(userInfo);
    }

    @Override
    public UserInfo getUserInfo() {
        String username = authenticationService.getUsername();
        return userInfoMapper.selectOne(new QueryWrapper<UserInfo>()
                .eq("username", username));
    }

    @Override
    public UserInfoVO getUserInfoByUsername(String username) {
        UserInfo userInfo = userInfoMapper.selectOne(new QueryWrapper<UserInfo>()
                .eq("username", username));
        UserInfoVO vo = CopyUtil.copy(userInfo, UserInfoVO.class);
        vo.setStatusName(UserInfoStatus.getMessage(vo.getStatus()));
        return vo;
    }

    @Override
    public Result getUserInfoByCond(SelectUserDTO dto) {
        Page<UserInfo> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<UserInfo> userInfoPage = userInfoMapper.selectPage(page, new QueryWrapper<UserInfo>()
                .eq(StringUtils.isNotBlank(dto.getUsername()), "username", dto.getUsername())
                .like(StringUtils.isNotBlank(dto.getName()), "name", dto.getName())
                .like(StringUtils.isNotBlank(dto.getMajor()), "major", dto.getMajor()));
        List<UserInfoVO> list = CopyUtil.copyList(userInfoPage.getRecords(), UserInfoVO.class);
        list.forEach(vo -> {
            vo.setStatusName(UserInfoStatus.getMessage(vo.getStatus()));
        });
        return Result
                .success(list, userInfoPage.getCurrent(), userInfoPage.getTotal());
    }

    @Override
    public int modifyUserInfo(UpdateUserDTO dto) {
        String username =
                dto.getUsername() != null ? dto.getUsername() : authenticationService.getUsername();
        Integer userId = userEntityService.getByUsername(username).getUserId();
        if (null == userId) {
            return 0;
        } else {
            UserInfo userInfo = CopyUtil.copy(dto, UserInfo.class);
            userInfo.setUserId(userId);
            return userInfoMapper.updateById(userInfo);
        }
    }

    @Override
    public int uploadAvatar(MultipartFile file) throws IOException {
        byte[] data = file.getBytes();
        if (data.length > 1024000) {
            return 0;
        }
        // 将字节流转成字符串
        Base64.Encoder encoder = Base64.getEncoder();
        String avatar = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
        String username = authenticationService.getUsername();
        return userInfoMapper.update(null, new UpdateWrapper<UserInfo>()
                .eq("username", username)
                .set("avatar", avatar));
    }
}

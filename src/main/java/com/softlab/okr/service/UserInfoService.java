package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.entity.UserInfo;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface UserInfoService {
    // 登陆检查
    UserEntity loginCheck(LoginDTO loginDto) throws ServiceException;

    void saveUserInfo(int userId, String username) throws ServiceException;

    UserInfo getUserInfoByUsername(String username) throws ServiceException;

    PageInfo<UserInfo> getUserInfoByCond(SelectUserDTO dto) throws ServiceException;

    int modifyUserInfo(UpdateUserDTO dto) throws ServiceException;

    int uploadAvatar(String username, String avatar) throws ServiceException;

    int modifyPassword(String username, String password) throws ServiceException;


}

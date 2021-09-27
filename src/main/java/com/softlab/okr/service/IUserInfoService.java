package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.utils.Result;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface IUserInfoService extends IService<UserInfo> {


  int saveUserInfo(int userId, String username) throws ServiceException;

  UserInfo getUserInfo(String username) throws ServiceException;

  Result getUserInfoByCond(SelectUserDTO dto) throws ServiceException;

  int modifyUserInfo(UpdateUserDTO dto) throws ServiceException;

  int uploadAvatar(String username, String avatar) throws ServiceException;

}

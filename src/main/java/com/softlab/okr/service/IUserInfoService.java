package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.utils.Result;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface IUserInfoService extends IService<UserInfo> {


    int saveUserInfo(int userId, String username) throws ServiceException;

    UserInfo getUserInfo() throws ServiceException;

    UserInfoVO getUserInfoByUsername(String username) throws ServiceException;

    Result getUserInfoByCond(SelectUserDTO dto) throws ServiceException;

    int modifyUserInfo(UpdateUserDTO dto) throws ServiceException;

    int uploadAvatar(MultipartFile file) throws ServiceException, IOException;

}

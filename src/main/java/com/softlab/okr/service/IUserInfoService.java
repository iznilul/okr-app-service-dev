package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.dto.UpdateUserRoleDTO;
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


    int saveUserInfo(int userId, String username);

    UserInfo getUserInfo();

    UserInfoVO getUserInfoByUsername(String username);

    Result getUserInfoByCond(SelectUserDTO dto);

    void modifyUserInfo(UpdateUserDTO dto);

    void modifyUserRole(UpdateUserRoleDTO dto);

    int uploadAvatar(MultipartFile file) throws IOException;

}

package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.dto.UpdateUserDTO;
import com.softlab.okr.model.dto.UpdateUserRoleDTO;
import com.softlab.okr.model.vo.UserInfoVO;
import com.softlab.okr.model.vo.UserRoleVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface IUserInfoService extends IService<UserInfo> {


    void saveUserInfo(int userId, String username);

    UserInfo getUserInfo();

    UserRoleVO getUserRole(String username);

    UserInfoVO getUserInfoByUsername(String username);

    Page<UserInfoVO> getUserInfoByCond(SelectUserDTO dto);

    void modifyUserInfo(UpdateUserDTO dto);

    void modifyUserRole(UpdateUserRoleDTO dto);

    void uploadAvatar(MultipartFile file) throws IOException;

}

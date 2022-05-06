package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.UserInfo;
import com.itlab.blog.model.dto.SelectUserDTO;
import com.itlab.blog.model.dto.UpdateUserDTO;
import com.itlab.blog.model.dto.UpdateUserRoleDTO;
import com.itlab.blog.model.vo.UserInfoVO;
import com.itlab.blog.model.vo.UserRoleVO;
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

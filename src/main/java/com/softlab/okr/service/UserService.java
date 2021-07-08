package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.bo.RegisterBo;
import com.softlab.okr.dto.user.LoginDto;
import com.softlab.okr.dto.user.SelectUserDto;
import com.softlab.okr.dto.user.UpdateUserDto;
import com.softlab.okr.model.User;

/**
 * @Author: Devhui
 * @Date: 2019/12/23 18:30
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */

public interface UserService {
    // 登陆检查
    User loginCheck(LoginDto loginDto);

    User selectUser(String account);

    //    List<User> selectByCond(SelectUserParam selectUserParam);
    PageInfo<User> selectByCond(SelectUserDto selectUserDto,
                                int pageSize);

    int updateUser(UpdateUserDto updateUserDto, long UpdateTime);

    int register(RegisterBo registerBo);

    int uploadAvatar(String account, String avatar);

    int verifyPassword(String account,String password,long updateTime);
}

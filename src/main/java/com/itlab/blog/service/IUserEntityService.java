package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.UserEntity;
import com.itlab.blog.model.dto.LoginDTO;
import com.itlab.blog.model.dto.ModifyPwdDTO;
import com.itlab.blog.model.dto.RegisterDTO;
import com.itlab.blog.model.vo.UserEntityVO;

/**
 * @author RudeCrab
 */
public interface IUserEntityService extends IService<UserEntity> {

    /**
     * 登录
     *
     * @param loginDTO 用户参数
     * @return 登录成功则返回vo对象，失败则抛出异常
     */
    UserEntityVO login(LoginDTO dto);

    UserEntity getByUsername(String username);

    void register(RegisterDTO dto);

    void removeByUsername(String username);

    void modifyPassword(ModifyPwdDTO dto);
}

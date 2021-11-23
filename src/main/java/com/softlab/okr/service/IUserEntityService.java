package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.dto.ModifyPwdDTO;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.vo.UserEntityVO;

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

    boolean register(RegisterDTO dto);

    boolean removeByUsername(String username);

    boolean loginCheck(UserEntity userEntity, String password);

    boolean modifyPassword(ModifyPwdDTO dto);
}

package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.bo.RegisterBo;
import com.softlab.okr.model.dto.LoginDTO;
import com.softlab.okr.model.entity.UserEntity;
import com.softlab.okr.model.vo.UserVO;

/**
 * @author RudeCrab
 */
public interface UserEntityService {
    /**
     * 登录
     *
     * @param loginDTO 用户参数
     * @return 登录成功则返回vo对象，失败则抛出异常
     */
    UserVO login(LoginDTO loginDTO) throws ServiceException;

    UserEntity getByUsername(String username) throws ServiceException;

    int register(RegisterBo registerBo) throws ServiceException;

}

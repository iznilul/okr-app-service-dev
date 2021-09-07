package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.RegisterDTO;
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
  UserVO login(UserEntity userEntity) throws ServiceException;

  UserEntity getByUsername(String username) throws ServiceException;

  void register(RegisterDTO dto) throws ServiceException;

  void removeByUsername(String username) throws ServiceException;

}

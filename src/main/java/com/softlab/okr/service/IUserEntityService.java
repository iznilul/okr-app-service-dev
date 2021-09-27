package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.RegisterDTO;
import com.softlab.okr.model.vo.UserVO;

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
  UserVO login(UserEntity userEntity) throws ServiceException;

  UserEntity getByUsername(String username) throws ServiceException;

  int register(RegisterDTO dto) throws ServiceException;

  int removeByUsername(String username) throws ServiceException;

}

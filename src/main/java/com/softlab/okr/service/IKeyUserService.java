package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.exception.ServiceException;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IKeyUserService extends IService<KeyUser> {

  int saveKeyUser(int keyId, int userId) throws ServiceException;

  int removeByUserId(int keyId, int userId) throws ServiceException;
}

package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.utils.Result;

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

  int modifyKeyUser(int keyId, int userId, int status);

  Result getKeyUser(PageDTO dto);

  int removeByUserId(int id) throws ServiceException;
}

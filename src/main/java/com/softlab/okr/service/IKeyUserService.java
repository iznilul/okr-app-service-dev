package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyUserVO;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
public interface IKeyUserService extends IService<KeyUser> {

    void saveKeyUser(int keyId, int userId);

    void modifyKeyUser(int keyId, int userId, int status);

    Page<KeyUserVO> getKeyUser(PageDTO dto);

    void removeByUserId(int id);
}

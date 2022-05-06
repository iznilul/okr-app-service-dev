package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.KeyUser;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.KeyUserVO;

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

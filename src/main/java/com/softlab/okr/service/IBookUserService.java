package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.BookUser;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.utils.Result;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-12-13
 */
public interface IBookUserService extends IService<BookUser> {

    Result getBookUserList(PageDTO dto);

    void saveBookUser(int bookId, int userId, int status);

    void modifyBookUser(int bookId, int userId, int status);

}

package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.BookUser;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.BookUserVO;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-12-13
 */
public interface IBookUserService extends IService<BookUser> {

    Page<BookUserVO> getBookUserList(PageDTO dto);

    void saveBookUser(int bookId, int userId, int status);

    void modifyBookUser(int bookId, int userId, int status);

}

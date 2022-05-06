package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.entity.BookUser;
import com.itlab.blog.mapper.BookUserMapper;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.enums.BookUserEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.model.vo.BookUserVO;
import com.itlab.blog.service.IBookUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-12-13
 */
@Service
public class BookUserServiceImpl extends ServiceImpl<BookUserMapper, BookUser> implements IBookUserService {

    @Autowired
    private BookUserMapper bookUserMapper;

    @Override
    @Cacheable(cacheNames = EntityNames.BOOK_USER + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<BookUserVO> getBookUserList(PageDTO dto) {
        Page<BookUser> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<BookUserVO> voPage = bookUserMapper.selectBookUserVO(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(BookUserEnum.getMessage(vo.getStatus()));
        });
        return voPage;
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.BOOK_USER, allEntries = true)
    public void saveBookUser(int bookId, int userId, int status) {
        BookUser bookUser = new BookUser(null, bookId, userId, BookUserEnum.NOT_RETURN.code(),
                null);
        if (bookUserMapper.insert(bookUser) != 1) {
            throw new BusinessException("更新书籍借阅状态失败");
        }
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.BOOK_USER, allEntries = true)
    public void modifyBookUser(int bookId, int userId, int status) {
        BookUser bookUser = bookUserMapper.selectOne(new QueryWrapper<BookUser>().eq("book_id",
                bookId).eq(
                "user_id", userId)
                .orderByDesc("id").last("limit 1"));
        bookUser.setStatus(status);
        if (bookUserMapper.updateById(bookUser) != 1) {
            throw new BusinessException("更新书籍借阅状态失败");
        }
    }

}

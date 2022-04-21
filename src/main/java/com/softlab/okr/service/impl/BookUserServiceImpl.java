package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.BookUser;
import com.softlab.okr.mapper.BookUserMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.BookUserEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.BookUserVO;
import com.softlab.okr.service.IBookUserService;
import com.softlab.okr.utils.Result;
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
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Result getBookUserList(PageDTO dto) {
        Page<BookUser> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<BookUserVO> voPage = bookUserMapper.selectBookUserVO(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(BookUserEnum.getMessage(vo.getStatus()));
        });
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
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

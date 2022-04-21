package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.BookTag;
import com.softlab.okr.mapper.BookTagMapper;
import com.softlab.okr.service.IBookTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-23
 */
@Service
public class BookTagServiceImpl extends ServiceImpl<BookTagMapper, BookTag> implements
        IBookTagService {

    @Autowired
    private BookTagMapper bookTagMapper;

    @Override
    @CacheEvict(cacheNames = EntityNames.BOOK_TAG, allEntries = true)
    public boolean saveBookTag(int bookId, List<Integer> list) {
        List<BookTag> bookTagList = list.stream().map(tagId -> {
            BookTag bookTag = new BookTag();
            bookTag.setBookId(bookId);
            bookTag.setTagId(tagId);
            return bookTag;
        }).collect(Collectors.toList());
        return this.saveBatch(bookTagList);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.BOOK_TAG + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<Integer> getTagIdList(int bookId) {
        List<BookTag> items = bookTagMapper.selectList(new QueryWrapper<BookTag>()
                .eq("book_id", bookId));
        return items.stream().map(BookTag::getTagId).collect(Collectors.toList());
    }

}

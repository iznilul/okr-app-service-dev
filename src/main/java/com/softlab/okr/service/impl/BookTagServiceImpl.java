package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.BookTag;
import com.softlab.okr.mapper.BookTagMapper;
import com.softlab.okr.service.IBookTagService;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
  public int saveBookTag(int bookId, List<Integer> list) {
    return bookTagMapper.insertBookTag(bookId, list);
  }

  @Override
  public List<Integer> getTagIdList(int bookId) {
    List<BookTag> items = bookTagMapper.selectList(new QueryWrapper<BookTag>()
        .eq("book_id", bookId));
<<<<<<< HEAD
    List<Long> list = items.stream().map(BookTag::getTagId).collect(Collectors.toList());
    
=======
    return items.stream().map(BookTag::getTagId).collect(Collectors.toList());
>>>>>>> mybatis plus重构
  }

}

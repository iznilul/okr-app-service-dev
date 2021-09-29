package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Book;
import com.softlab.okr.entity.BookTag;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.exception.ApiException;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.model.enums.statusCode.BookStatus;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.service.IBookTagService;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements
    IBookService {

  @Autowired
  private BookMapper bookMapper;

  @Autowired
  private IAuthenticationService authenticationService;

  @Autowired
  private IBookTagService bookTagService;

  @Autowired
  private ITagService tagService;

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public boolean saveBook(BookDTO dto) {
    Book book = dto.getBook();
    book.setStatus(0);
    int bookId = bookMapper.insert(book);
    if (bookId == 0) {
      return false;
    } else {
      List<Tag> tagList = dto.getTagList();
      List<Integer> tagIdList = tagList.stream().map(Tag::getTagId)
          .collect(Collectors.toList());
      return bookTagService.saveBookTag(bookId, tagIdList);
    }
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public boolean removeBook(int bookId) {
    return bookTagService.remove(new QueryWrapper<BookTag>().eq("book_id", bookId)) &&
        bookMapper.deleteById(bookId) == 1;
  }

  @Override
  public int borrowBook(int bookId) {
    int userId = authenticationService.getUserId();
    return bookMapper
        .update(null, new UpdateWrapper<Book>().eq("book_id", bookId).set("user_id", userId));
  }

  @Override
  public int returnBook(int bookId) {
    if (!authenticationService.getUserId().equals(bookMapper.selectById(bookId).getUserId())) {
      return 0;
    }
    return bookMapper
        .update(null, new UpdateWrapper<Book>().eq("book_id", bookId).set("user_id", null));
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public boolean modifyBook(BookDTO dto) {
    Book book = dto.getBook();
    List<Integer> tagIdList = dto.getTagList().stream().map(Tag::getTagId)
        .collect(Collectors.toList());
    return bookTagService
        .remove(new QueryWrapper<BookTag>().eq("book_id", book.getBookId()))
        && bookTagService.saveBookTag(book.getBookId(), tagIdList)
        && (bookMapper.updateById(book) == 1);
  }

  @Override
  public int uploadBookImg(int bookId, MultipartFile file) throws IOException {
    // 通过base64来转化图片
    byte[] data = file.getBytes();
    if (data.length > 1024000) {
      throw new ApiException();
    }
    // 将字节流转成字符串
    Base64.Encoder encoder = Base64.getEncoder();
    String img = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
    return bookMapper.update(null, new UpdateWrapper<Book>().
        eq("book_id", bookId)
        .set("img", img));
  }

  @Override
  public Result getByCond(BookQueryDTO dto) {
    Page<Book> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<BookVO> voPage = bookMapper.selectByCond(page, dto.getBookName(), dto.getPublisher(),
        BookStatus.getCode(dto.getStatusName()));
    if (voPage.getSize() == 0) {
      page.setCurrent(1);
      voPage = bookMapper.selectByCond(page, dto.getBookName(), dto.getPublisher(),
          BookStatus.getCode(dto.getStatusName()));
    }
    voPage.getRecords().forEach(vo -> {
      vo.setStatusName(BookStatus.getMessage(vo.getStatus()));
      vo.setTagList(tagService.list(new QueryWrapper<Tag>()
          .select("tag_id").eq("book_id", vo.getBookId())));
    });
    return Result.success(voPage.getRecords(), voPage.getTotal());
  }
}

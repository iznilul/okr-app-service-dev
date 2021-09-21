package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Book;
import com.softlab.okr.entity.BookTag;
import com.softlab.okr.exception.ApiException;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.enums.statusCode.BookStatus;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.service.IBookTagService;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
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

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public Result saveBook(BookVO vo) {
    Book book = new Book(null, vo.getBookName(), null, vo.getPublisher(), vo.getPrice(), 0, null);
    boolean flag = (bookMapper.insert(book) == 1) && (
        bookTagService.saveBookTag(vo.getBookId(), vo.getTagIdList()) == 1);
    return flag ?
        Result.success() : Result.failure();
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public Result removeBook(int bookId) {
    int flag = bookMapper.deleteById(bookId);
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result borrowBook(int bookId) {
    int userId = authenticationService.getUserId();
    int flag = bookMapper
        .update(null, new UpdateWrapper<Book>().eq("book_id", bookId).set("user_id", userId));
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result returnBook(int bookId) {
    if (!authenticationService.getUserId().equals(bookMapper.selectById(bookId).getUserId())) {
      return Result.failure();
    }
    int flag = bookMapper
        .update(null, new UpdateWrapper<Book>().eq("book_id", bookId).set("user_id", null));
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public Result modifyBook(BookVO vo) {
    vo.setStatus(BookStatus.getCode(vo.getStatusName()));
    int bookId = vo.getBookId();
    boolean flag = (bookTagService
        .remove(new QueryWrapper<BookTag>().eq("book_id", bookId)))
        && (bookTagService.saveBookTag(bookId, vo.getTagIdList()) == 1)
        && (bookMapper.updateBook(vo) == 1);
    return flag ? Result.success() : Result.failure();
  }

  @Override
  public Result uploadBookImg(int bookId, MultipartFile file) throws IOException {
    // 通过base64来转化图片
    byte[] data = file.getBytes();
    if (data.length > 1024000) {
      throw new ApiException();
    }
    // 将字节流转成字符串
    Base64.Encoder encoder = Base64.getEncoder();
    String img = "data:image/png;base64," + encoder.encodeToString(file.getBytes());
    int flag = bookMapper.update(null, new UpdateWrapper<Book>().
        eq("book_id", bookId)
        .set("img", img));
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result getByCond(BookDTO dto) {
    Page<Book> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<BookVO> bookVOPage = bookMapper.selectByCond(page, dto.getBookName(), dto.getPublisher(),
        BookStatus.getCode(dto.getStatusName()));
    List<BookVO> list = bookVOPage.getRecords();
    list.forEach(vo -> {
      vo.setStatusName(BookStatus.getMessage(vo.getStatus()));
      vo.setTagIdList(bookTagService.list(new QueryWrapper<BookTag>()
          .select("tag_id").eq("book_id", vo.getBookId())));
    });
    return list.size() > 0 ? Result.success(list) : Result.failure();
  }
}

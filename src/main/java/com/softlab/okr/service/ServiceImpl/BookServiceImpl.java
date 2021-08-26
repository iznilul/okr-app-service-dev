package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.convert.impl.BookConvert;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.bo.BookBo;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.service.BookService;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BookServiceImpl implements BookService {

  @Autowired
  BookMapper bookMapper;

  @Autowired
  UserInfoMapper userInfoMapper;

  @Autowired
  BookConvert bookConvert;

  private static final HashMap<String, Integer> map = new HashMap<>();

  static {
    map.put("空闲", 0);
    map.put("已借阅", 1);
    map.put("丢失", 2);
    map.put("", null);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int saveBook(BookVO bookVO) {
    int bookId = bookMapper.insertBook(bookVO);
    BookTagBo bookTagBo = new BookTagBo(bookId, bookVO.getTagIdList());
    return bookMapper.insertBookTag(bookTagBo);
  }

  @Override
  public int removeById(int bookId) {
    return bookMapper.deleteById(bookId);
  }

  @Override
  public int modifyById(Book book) {
    return bookMapper.updateById(book);
  }

  @Override
  public List<Book> list() {
    return bookMapper.selectList();
  }

  @Override
  public PageInfo<BookVO> getByCond(BookDTO bookDTO) {
    PageHelper.startPage(bookDTO.getIndex(), bookDTO.getPageSize());
    List<BookVO> list = new LinkedList<>();
    String userName = bookDTO.getUserName();
    Integer userId =
        userName.equals("") ? null :
            userInfoMapper.selectUserInfoByUsername(userName).getUserId();
    BookBo bookBo =
        new BookBo(
            bookDTO.getBookName(), bookDTO.getPublisher(), map.get(bookDTO.getStatus()),
            userId);
    List<Book> bookList = bookMapper.selectByCond(bookBo);
    bookList.forEach(book -> {
      list.add(bookConvert.convertVO(book));
    });
    return new PageInfo<>(list);
  }
}

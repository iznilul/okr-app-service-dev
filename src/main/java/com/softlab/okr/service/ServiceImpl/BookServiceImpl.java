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
    BookTagBo bookTagBo = new BookTagBo(bookVO.getBookId(), bookVO.getTagIdList());
    bookMapper.insertBookTag(bookTagBo);
    return bookMapper.insertBook(bookVO);
  }

  @Override
  public int removeById(int bookId) {
    bookMapper.deleteBookTagByBookId(bookId);
    return bookMapper.deleteById(bookId);
  }

  @Override
  public int borrowBook(int bookId, int userId) {
    return bookMapper.borrow(bookId, userId);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int modifyById(BookVO bookVO) {
    BookTagBo bookTagBo = new BookTagBo(bookVO.getBookId(), bookVO.getTagIdList());
    bookMapper.deleteBookTagByBookId(bookVO.getBookId());
    bookMapper.insertBookTag(bookTagBo);
    return bookMapper.updateById(bookVO);
  }

  @Override
  public int modifyBookImg(int bookId, String img) {
    return bookMapper.updateImg(bookId, img);
  }

  @Override
  public List<Book> list() {
    return bookMapper.selectList();
  }

  @Override
  public PageInfo<BookVO> getByCond(BookDTO bookDTO) {
    PageHelper.startPage(bookDTO.getIndex(), bookDTO.getPageSize());
    List<BookVO> list = new LinkedList<>();
    BookBo bookBo =
        new BookBo(bookDTO.getBookName(), bookDTO.getPublisher(), map.get(bookDTO.getStatus()));
    List<Book> bookList = bookMapper.selectByCond(bookBo);
    bookList.forEach(
        book -> {
          BookVO bookVO = bookConvert.convertVO(book);
          bookVO.setTagIdList(bookMapper.selectTagIdByBookId(book.getBookId()));
          bookVO.setUserName(
              book.getUserId() == null ? null :
                  userInfoMapper.selectNameById(book.getUserId()));
          list.add(bookVO);
        });
    return new PageInfo<>(list);
  }
}

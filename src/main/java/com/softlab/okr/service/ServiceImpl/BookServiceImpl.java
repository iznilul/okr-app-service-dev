package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.mapper.UserInfoMapper;
import com.softlab.okr.model.bo.BookBo;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

  @Autowired
  BookMapper bookMapper;

  @Autowired
  UserInfoMapper userInfoMapper;

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

  public List<Book> list() {
    return bookMapper.selectList();
  }

  public PageInfo<Book> getByCond(BookDTO bookDTO) {
    PageHelper.startPage(bookDTO.getIndex(), bookDTO.getPageSize());
    String userName = bookDTO.getUserName();
    Integer userId =
            userName.equals("") ? null :
                    userInfoMapper.selectUserInfoByUsername(userName).getUserId();
    BookBo bookBo =
            new BookBo(
                    bookDTO.getBookName(), bookDTO.getPublisher(), map.get(bookDTO.getStatus()),
                    userId);
    List<Book> list = bookMapper.selectByCond(bookBo);
    return new PageInfo<>(list);
  }
}

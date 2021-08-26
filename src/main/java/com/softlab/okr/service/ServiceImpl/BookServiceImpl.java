package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.service.BookService;
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

  @Override
  @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class, readOnly = false)
  public int saveBook(Book book, List<Integer> tagIds) {
    int bookId = bookMapper.insertBook(book);
    BookTagBo bookTagBo = new BookTagBo(bookId, tagIds);
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
    
    List<Book> list = bookMapper.selectByCond(bookDTO);
    return new PageInfo<>(list);
  }
}

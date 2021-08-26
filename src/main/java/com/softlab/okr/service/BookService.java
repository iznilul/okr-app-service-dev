package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import java.util.List;

public interface BookService {

  int saveBook(BookVO bookVO) throws ServiceException;

  int removeById(int bookId) throws ServiceException;

  int modifyById(Book book) throws ServiceException;

  List<Book> list() throws ServiceException;

  PageInfo<BookVO> getByCond(BookDTO bookDTO) throws ServiceException;
}

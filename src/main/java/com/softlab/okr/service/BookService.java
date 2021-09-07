package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.vo.BookVO;
import java.util.List;

public interface BookService {

  int saveBook(BookVO vo) throws ServiceException;

  int removeById(int bookId) throws ServiceException;

  int modifyById(BookVO vo) throws ServiceException;

  int modifyBookImg(int bookId, String img) throws ServiceException;

  int borrowBook(int bookId, int userId) throws ServiceException;

  int returnBook(int bookId, int userId) throws ServiceException;

  List<BookVO> list() throws ServiceException;

  PageInfo<BookVO> getByCond(BookDTO dto) throws ServiceException;
}

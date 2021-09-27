package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Book;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.vo.BookVO;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

  boolean saveBook(BookVO vo) throws ServiceException;

  boolean modifyBook(BookVO vo) throws ServiceException;

  int uploadBookImg(int bookId, MultipartFile file) throws ServiceException, IOException;

  int borrowBook(int bookId) throws ServiceException;

  int returnBook(int bookId) throws ServiceException;

  Page<BookVO> getByCond(BookDTO dto) throws ServiceException;

  int removeBook(int bookId) throws ServiceException;
}

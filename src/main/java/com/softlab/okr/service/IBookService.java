package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Book;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

  boolean saveBook(BookDTO dto) throws ServiceException;

  boolean modifyBook(BookDTO dto) throws ServiceException;

  int uploadBookImg(int bookId, MultipartFile file) throws ServiceException, IOException;

  int borrowBook(int bookId) throws ServiceException;

  int returnBook(int bookId) throws ServiceException;

  Result getByCond(BookQueryDTO dto) throws ServiceException;

  boolean removeBook(int bookId) throws ServiceException;
}

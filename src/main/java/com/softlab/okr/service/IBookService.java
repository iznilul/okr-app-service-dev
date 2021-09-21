package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Book;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

  Result saveBook(BookVO vo) throws ServiceException;

  Result modifyBook(BookVO vo) throws ServiceException;

  Result uploadBookImg(int bookId, MultipartFile file) throws ServiceException, IOException;

  Result borrowBook(int bookId) throws ServiceException;

  Result returnBook(int bookId) throws ServiceException;

  Result getByCond(BookDTO dto) throws ServiceException;

  Result removeBook(int bookId) throws ServiceException;
}

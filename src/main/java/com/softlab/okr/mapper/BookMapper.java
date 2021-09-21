package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface BookMapper extends BaseMapper<Book> {

  int updateBook(BookVO vo) throws DataAccessException;

  int borrowBook(int bookId, int userId) throws DataAccessException;

  int returnBook(int bookId, int userId) throws DataAccessException;

  Page<BookVO> selectByCond(Page<Book> page, String bookName, String publisher, Integer status)
      throws DataAccessException;
}

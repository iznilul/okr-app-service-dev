package com.softlab.okr.mapper;

import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface BookMapper {

  int insertBook(Book book) throws DataAccessException;

  int deleteById(int bookId) throws DataAccessException;

  int updateById(Book book) throws DataAccessException;

  int insertBookTag(BookTagBo bookTagBo) throws DataAccessException;

  List<Book> selectList() throws DataAccessException;

  List<Book> selectByCond(BookDTO bookDTO) throws DataAccessException;
}

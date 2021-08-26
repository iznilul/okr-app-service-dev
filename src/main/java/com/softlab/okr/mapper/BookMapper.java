package com.softlab.okr.mapper;

import com.softlab.okr.model.bo.BookBo;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

  int insertBook(BookVO bookVO) throws DataAccessException;

  int deleteById(int bookId) throws DataAccessException;

  int updateById(Book book) throws DataAccessException;

  int insertBookTag(BookTagBo bookTagBo) throws DataAccessException;

  List<Book> selectList() throws DataAccessException;

  List<Book> selectByCond(BookBo bookBo) throws DataAccessException;
}

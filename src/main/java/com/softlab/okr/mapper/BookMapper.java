package com.softlab.okr.mapper;

import com.softlab.okr.model.bo.BookBo;
import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface BookMapper {

  int insertBook(BookVO bookVO) throws DataAccessException;

  int deleteById(int bookId) throws DataAccessException;

  int deleteBookTagByBookId(int bookId) throws DataAccessException;

  int deleteBookTagByTagId(int tagId) throws DataAccessException;

  int updateById(BookVO bookVO) throws DataAccessException;

  int insertBookTag(BookTagBo bookTagBo) throws DataAccessException;

  int updateBookTag(BookTagBo bookTagBo) throws DataAccessException;

  int borrow(int bookId, int userId) throws DataAccessException;

  List<Book> selectList() throws DataAccessException;

  List<Book> selectByCond(BookBo bookBo) throws DataAccessException;

  int updateImg(int bookId, String img) throws DataAccessException;

  List<Integer> selectTagIdByBookId(int bookId) throws DataAccessException;
}

package com.softlab.okr.mapper;

import com.softlab.okr.model.bo.BookTagBo;
import com.softlab.okr.model.vo.BookVO;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface BookMapper {

  int insertBook(BookVO vo) throws DataAccessException;

  int deleteById(int bookId) throws DataAccessException;

  int deleteBookTagByBookId(int bookId) throws DataAccessException;

  int deleteBookTagByTagId(int tagId) throws DataAccessException;

  int updateById(BookVO vo) throws DataAccessException;

  int insertBookTag(BookTagBo bookTagBo) throws DataAccessException;

  int updateBookTag(BookTagBo bookTagBo) throws DataAccessException;

  int borrowBook(int bookId, int userId) throws DataAccessException;

  int returnBook(int bookId, int userId) throws DataAccessException;

  List<BookVO> selectList() throws DataAccessException;

  List<BookVO> selectByCond(String bookName, String publisher, Integer status)
      throws DataAccessException;

  int updateImg(int bookId, String img) throws DataAccessException;

  List<Integer> selectTagIdByBookId(int bookId) throws DataAccessException;
}

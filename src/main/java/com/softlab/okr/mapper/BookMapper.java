package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.Book;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    int insertBook(Book book) throws DataAccessException;

    int deleteById(int bookId) throws DataAccessException;

    int updateById(Book book) throws DataAccessException;

    List<Book> selectList() throws DataAccessException;

    List<Book> selectByColunm() throws DataAccessException;
}

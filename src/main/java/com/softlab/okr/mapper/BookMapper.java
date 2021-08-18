package com.softlab.okr.mapper;

import com.softlab.okr.exception.MapperException;
import com.softlab.okr.model.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    void insertBook(Book book) throws MapperException;

    void deleteById(int bookId) throws MapperException;

    void updateById(Book book) throws MapperException;

    List<Book> selectList() throws MapperException;
}

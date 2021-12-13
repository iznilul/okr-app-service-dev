package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookMapper extends BaseMapper<Book> {

    Page<BookVO> selectBookList(@Param("page") Page<Book> page, String bookName, String publisher);

    BookVO selectBook(int bookId);
}

package com.softlab.okr.convert.impl;

import com.softlab.okr.convert.ConvertService;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.model.vo.BookVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-26 17:27
 **/
@Service
public class BookConvert implements ConvertService<Book, BookVO> {

  @Override
  public BookVO convertVO(Book book) {
    BookVO vo = new BookVO();
    BeanUtils.copyProperties(book, vo);
    return vo;
  }
}

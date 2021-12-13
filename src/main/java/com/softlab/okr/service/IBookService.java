package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Book;
import com.softlab.okr.model.dto.BookChangeDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.utils.Result;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

    void saveBook(String bookName);

    void modifyBook(BookChangeDTO dto);

    void modifyBookImg(int bookId, MultipartFile file);

    void borrowBook(int bookId);

    void returnBook(int bookId);

    Result getBookList(BookQueryDTO dto);

    BookVO getBook(int bookId);

    void removeBook(int bookId);
}

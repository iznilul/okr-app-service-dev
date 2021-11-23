package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Book;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.utils.Result;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

    boolean saveBook(BookDTO dto);

    boolean modifyBook(BookDTO dto);

    int modifyBookImg(int bookId, MultipartFile file) ,IOException;

    int borrowBook(int bookId);

    int returnBook(int bookId);

    Result getByCond(BookQueryDTO dto);

    boolean removeBook(int bookId);
}

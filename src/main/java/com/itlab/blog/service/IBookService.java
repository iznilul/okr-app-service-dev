package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Book;
import com.itlab.blog.model.dto.BookChangeDTO;
import com.itlab.blog.model.dto.BookQueryDTO;
import com.itlab.blog.model.vo.BookVO;
import org.springframework.web.multipart.MultipartFile;

public interface IBookService extends IService<Book> {

    void saveBook(String bookName);

    void modifyBook(BookChangeDTO dto);

    void modifyBookImg(int bookId, MultipartFile file);

    void borrowBook(int bookId);

    void returnBook(int bookId);

    Page<BookVO> getBookList(BookQueryDTO dto);

    BookVO getBook(int bookId);

    void removeBook(int bookId);
}

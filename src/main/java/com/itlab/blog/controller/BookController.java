package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.BookChangeDTO;
import com.itlab.blog.model.dto.BookQueryDTO;
import com.itlab.blog.model.vo.BookVO;
import com.itlab.blog.service.IBookService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-11-21 15:46
 **/
@RestController
@RequestMapping("/blog/book")
public class BookController {

    @Autowired
    private IBookService bookService;

    @GetMapping("add")
    @Auth(role = RoleConstants.ADMIN, name = "添加书籍")
    public Result addBook(@RequestParam("param") @NotBlank(message = "书名不能为空") String bookName) {
        bookService.saveBook(bookName);
        return Result.success();
    }

    @PostMapping("changeImg")
    @Auth(role = RoleConstants.ADMIN, name = "上传书籍照片")
    public Result changeBookImg(
            @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file) {
        bookService.modifyBookImg(bookId, file);
        return Result.success();
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.ADMIN, name = "修改书籍")
    public Result changeBook(@RequestBody BookChangeDTO dto) {
        bookService.modifyBook(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除书籍")
    public Result cancelBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.removeBook(bookId);
        return Result.success();
    }

    @PostMapping("queryList")
    @Auth(role = RoleConstants.USER, name = "书籍列表")
    public Result queryBookList(@RequestBody @Validated BookQueryDTO dto) {
        Page<BookVO> page = bookService.getBookList(dto);
        return Result.success(page.getRecords(), page.getCurrent(), page.getTotal());
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.USER, name = "请求书籍")
    public Result queryBook(@RequestParam("bookId") @NotNull int bookId) {
        BookVO vo = bookService.getBook(bookId);
        return Result.success(vo);
    }

    @GetMapping("borrow")
    @Auth(role = RoleConstants.ADMIN, name = "借书")
    public Result borrowBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.borrowBook(bookId);
        return Result.success();
    }

    @GetMapping("return")
    @Auth(role = RoleConstants.ADMIN, name = "还书")
    public Result returnBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.returnBook(bookId);
        return Result.success();
    }

}

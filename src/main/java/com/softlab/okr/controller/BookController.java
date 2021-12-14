package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.BookChangeDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-11-21 15:46
 **/
@RestController
@RequestMapping("/api/okr/book")
@Api(tags = "管理员 书籍接口")
public class BookController {

    @Autowired
    private IBookService bookService;

    @GetMapping("add")
    @ApiOperation("添加书籍")
    @Auth(role = RoleConstants.ADMIN, name = "添加书籍")
    public Result addBook(@RequestParam("param") @NotBlank(message = "书名不能为空") String bookName) {
        bookService.saveBook(bookName);
        return Result.success();
    }

    @PostMapping("changeImg")
    @ApiOperation("上传书籍照片")
    @Auth(role = RoleConstants.ADMIN, name = "上传书籍照片")
    public Result changeBookImg(
            @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file) {
        bookService.modifyBookImg(bookId, file);
        return Result.success();
    }

    @PostMapping("change")
    @ApiOperation("修改书籍")
    @Auth(role = RoleConstants.ADMIN, name = "修改书籍")
    public Result changeBook(@RequestBody BookChangeDTO dto) {
        bookService.modifyBook(dto);
        return Result.success();
    }

    @GetMapping("cancel")
    @ApiOperation("删除书籍")
    @Auth(role = RoleConstants.ADMIN, name = "删除书籍")
    public Result cancelBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.removeBook(bookId);
        return Result.success();
    }

    @PostMapping("queryList")
    @ApiOperation("书籍列表")
    @Auth(role = RoleConstants.USER, name = "书籍列表")
    public Result queryBookList(@RequestBody @Validated BookQueryDTO dto) {
        return bookService.getBookList(dto);
    }

    @GetMapping("query")
    @ApiOperation("请求书籍")
    @Auth(role = RoleConstants.USER, name = "请求书籍")
    public Result queryBook(@RequestParam("bookId") @NotNull int bookId) {
        BookVO vo = bookService.getBook(bookId);
        return Result.success(vo);
    }

    @GetMapping("borrow")
    @ApiOperation("借书")
    @Auth(role = RoleConstants.ADMIN, name = "借书")
    public Result borrowBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.borrowBook(bookId);
        return Result.success();
    }

    @GetMapping("return")
    @ApiOperation("还书")
    @Auth(role = RoleConstants.ADMIN, name = "还书")
    public Result returnBook(@RequestParam("bookId") @NotNull int bookId) {
        bookService.returnBook(bookId);
        return Result.success();
    }

}

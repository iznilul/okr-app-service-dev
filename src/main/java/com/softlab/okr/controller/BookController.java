package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping("add")
    @ApiOperation("添加书籍")
    @Auth(role = RoleConstants.ADMIN, name = "添加书籍")
    public Result addBook(@RequestBody BookDTO dto) {

        return bookService.saveBook(dto) ?
                Result.success() : Result.failure();
    }

    @GetMapping("changeImg")
    @ApiOperation("上传书籍照片")
    @Auth(role = RoleConstants.ADMIN, name = "上传书籍照片")
    public Result changeBookImg(
            @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file)
            throws Exception {

        return bookService.modifyBookImg(bookId, file) == 1 ?
                Result.success() : Result.failure();
    }

    @PostMapping("change")
    @ApiOperation("修改书籍")
    @Auth(role = RoleConstants.ADMIN, name = "修改书籍")
    public Result changeBook(@RequestBody BookDTO dto) {

        return bookService.modifyBook(dto) ?
                Result.success() : Result.failure();
    }

    @GetMapping("cancel")
    @ApiOperation("删除书籍")
    @Auth(role = RoleConstants.ADMIN, name = "删除书籍")
    public Result cancelBook(@RequestParam("bookId") @NotNull int bookId) {

        return bookService.removeBook(bookId) ?
                Result.success() : Result.failure();
    }

    @PostMapping("query")
    @ApiOperation("书籍列表")
    @Auth(role = RoleConstants.USER, name = "书籍列表")
    public Result queryBook(@RequestBody @Validated BookQueryDTO dto) {
        return bookService.getByCond(dto);
    }

    @GetMapping("borrow")
    @ApiOperation("借书")
    @Auth(role = RoleConstants.ADMIN, name = "借书")
    public Result borrowBook(@RequestParam("bookId") @NotNull int bookId) {
        return bookService.borrowBook(bookId) == 1 ?
                Result.success() : Result.failure();
    }

    @GetMapping("return")
    @ApiOperation("还书")
    @Auth(role = RoleConstants.ADMIN, name = "还书")
    public Result returnBook(@RequestParam("bookId") @NotNull int bookId) {
        return bookService.returnBook(bookId) == 1 ?
                Result.success() : Result.failure();
    }

}

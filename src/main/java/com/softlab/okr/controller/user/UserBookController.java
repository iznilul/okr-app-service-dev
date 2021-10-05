package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.BookQueryDTO;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/api/user/book")
@Api(tags = "用户 书籍接口")
@Auth(id = 3500, name = "用户 书籍接口")
public class UserBookController {

  @Autowired
  private IBookService bookService;

  @PostMapping("query")
  @ApiOperation("书籍列表")
  @Auth(id = 1, name = "书籍列表")
  public Result queryBook(@RequestBody @Validated BookQueryDTO dto) {
    return bookService.getByCond(dto);
  }

  @GetMapping("borrow")
  @ApiOperation("借书")
  @Auth(id = 2, name = "借书")
  public Result borrowBook(@RequestParam("bookId") @NotNull int bookId) {
    return bookService.borrowBook(bookId) == 1 ?
        Result.success() : Result.failure();
  }

  @GetMapping("return")
  @ApiOperation("还书")
  @Auth(id = 3, name = "还书")
  public Result returnBook(@RequestParam("bookId") @NotNull int bookId) {
    return bookService.returnBook(bookId) == 1 ?
        Result.success() : Result.failure();
  }

}

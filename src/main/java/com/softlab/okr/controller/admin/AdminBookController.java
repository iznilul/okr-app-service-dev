package com.softlab.okr.controller.admin;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.service.IBookService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.validation.constraints.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/api/admin/book")
@Api(tags = "管理员 书籍接口")
@Auth(id = 2500, name = "管理员 书籍接口")
public class AdminBookController {

  @Autowired
  private IBookService bookService;


  @PostMapping("add")
  @ApiOperation("添加书籍")
  @Auth(id = 1, name = "添加书籍")
  public Result addBook(@RequestBody BookDTO dto) {

    return bookService.saveBook(dto) ?
        Result.success() : Result.failure();
  }

  @GetMapping("changeImg")
  @ApiOperation("上传书籍照片")
  @Auth(id = 2, name = "上传书籍照片")
  public Result changeBookImg(
      @RequestParam("bookId") int bookId, @RequestParam("file") MultipartFile file)
      throws Exception {

    return bookService.modifyBookImg(bookId, file) == 1 ?
        Result.success() : Result.failure();
  }

  @PostMapping("change")
  @ApiOperation("修改书籍")
  @Auth(id = 3, name = "修改书籍")
  public Result changeBook(@RequestBody BookDTO dto) {

    return bookService.modifyBook(dto) ?
        Result.success() : Result.failure();
  }

  @GetMapping("cancel")
  @ApiOperation("删除书籍")
  @Auth(id = 4, name = "删除书籍")
  public Result cancelBook(@RequestParam("bookId") @NotNull int bookId) {

    return bookService.removeBook(bookId) ?
        Result.success() : Result.failure();
  }
}

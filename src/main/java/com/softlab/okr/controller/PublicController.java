package com.softlab.okr.controller;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.entity.Book;
import com.softlab.okr.service.BookService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/api/user/public")
@Api(tags = "公共物品的操作")
@Auth(id = 4000, name = "公共物品的操作")
public class PublicController {

  @Autowired
  BookService bookService;

  @GetMapping("getBookByCond")
  @ApiOperation("书籍列表")
  @Auth(id = 1, name = "书籍列表")
  public Result getBookByCond(@RequestBody @Validated BookDTO bookDTO) {
    PageInfo<Book> list = bookService.getByCond(bookDTO);
  }

}

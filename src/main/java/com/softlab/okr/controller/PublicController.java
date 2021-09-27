package com.softlab.okr.controller;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.entity.Key;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.BookDTO;
import com.softlab.okr.model.vo.BookVO;
import com.softlab.okr.security.AuthenticationService;
import com.softlab.okr.service.BookService;
import com.softlab.okr.service.KeyService;
import com.softlab.okr.service.TagService;
import com.softlab.okr.service.UserEntityService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import java.util.List;
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
@RequestMapping("/api/user/public")
@Api(tags = "公共物品的操作")
@Auth(id = 4000, name = "公共物品的操作")
public class PublicController {


  @Autowired
  private BookService bookService;

  @Autowired
  private TagService tagService;

  @Autowired
  private KeyService keyService;

  @Autowired
  AuthenticationService authenticationService;

  @Autowired
  UserEntityService userEntityService;

  @PostMapping("getBookByCond")
  @ApiOperation("书籍列表")
  @Auth(id = 1, name = "书籍列表")
  public Result getBookByCond(@RequestBody @Validated BookDTO dto) {
    PageInfo<BookVO> list = bookService.getByCond(dto);
    if (list.getSize() > 0) {
      return Result.success(list);
    } else {
      return Result.failure();
    }
  }

  @GetMapping("getTagList")
  @ApiOperation("标签列表")
  @Auth(id = 2, name = "标签列表")
  public Result getTagList() {
    List<Tag> list = tagService.getTagList();
    if (list.size() > 0) {
      return Result.success(list);
    } else {
      return Result.failure();
    }
  }

  @GetMapping("getKeyList")
  @ApiOperation("钥匙列表")
  @Auth(id = 3, name = "钥匙列表")
  public Result getKeyList() {
    List<Key> list = keyService.list();
    if (list.size() > 0) {
      return Result.success(list);
    } else {
      return Result.failure();
    }
  }

  @GetMapping("borrowBook")
  @ApiOperation("借书")
  @Auth(id = 4, name = "借书")
  public Result borrowBook(@RequestParam("bookId") @NotNull int bookId) {
    String username = authenticationService.getPrincipal().getUsername();

    int userId = userEntityService.getByUsername(username).getUserId();
    if (bookService.borrowBook(bookId, userId) == 1) {
      return Result.success();
    } else {
      return Result.failure();
    }
  }

  @GetMapping("returnBook")
  @ApiOperation("还书")
  @Auth(id = 5, name = "还书")
  public Result returnBook(@RequestParam("bookId") @NotNull int bookId) {
    String username = authenticationService.getPrincipal().getUsername();

    int userId = userEntityService.getByUsername(username).getUserId();
    if (bookService.returnBook(bookId, userId) == 1) {
      return Result.success();
    } else {
      return Result.failure();
    }
  }

}

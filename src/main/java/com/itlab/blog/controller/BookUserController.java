package com.itlab.blog.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.BookUserVO;
import com.itlab.blog.service.IBookUserService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-11-21 15:46
 **/
@RestController
@RequestMapping("/blog/bookUser")

public class BookUserController {

    @Autowired
    private IBookUserService bookUserService;

    @PostMapping("query")
    @Auth(role = RoleConstants.USER, name = "查询借阅记录")
    public Result queryBookUser(@RequestBody @Validated PageDTO dto) {
        Page<BookUserVO> vopage = bookUserService.getBookUserList(dto);
        return Result.success(vopage.getRecords(), vopage.getCurrent(), vopage.getTotal());
    }

}

package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.BookUserVO;
import com.softlab.okr.service.IBookUserService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-11-21 15:46
 **/
@RestController
@RequestMapping("/okr/bookUser")

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

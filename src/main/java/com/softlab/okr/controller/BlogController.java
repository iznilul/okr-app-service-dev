package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/okr/blog")
public class BlogController {

    @Autowired
    private IBlogService blogService;


    @PostMapping("add")
    @Auth(role = RoleConstants.COMMON, name = "上传博客文件")
    public Result addBlog(
            @RequestParam("title") String title,
            @RequestParam("file") MultipartFile file,
            @RequestParam("originalIsOrNot") Integer originalIsOrNot,
            @RequestParam(value = "originUrl",required = false) String originUrl,
            @RequestParam("categoryName") String categoryName,
            @RequestParam("tagList") List<String> tagList) {
        System.out.println("sdfsadfeas");
        //blogService.saveBlog();
        return Result.success();
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "查看博客")
    public Result queryBlog(@RequestParam("id") String id) {
        blogService.getBlog("1");
        return Result.success();
    }
}

package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/okr/blog")
public class BlogController {

    @Autowired
    private IBlogService blogService;


    @GetMapping("upload")
    @Auth(role = RoleConstants.COMMON, name = "上传博客文件")
    public Result changeResource(@RequestParam("file") MultipartFile file) {
        blogService.uploadMarkdown(file);
        return Result.success();
    }
}

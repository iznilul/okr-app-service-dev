package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.model.vo.BlogVO;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.SecurityUtil;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@Validated
@RestController
@RequestMapping("/okr/blog")
public class BlogController {

    @Autowired
    private IBlogService blogService;


    @PostMapping("add")
    @Auth(role = RoleConstants.COMMON, name = "上传博客文件")
    public Result addBlog(
            @RequestParam("title") @NotBlank String title,
            @RequestParam("file") @NotNull MultipartFile file,
            @RequestParam("originalIsOrNot") @Range(min = 0, max = 1) Integer originalIsOrNot,
            @RequestParam(value = "originUrl", required = false) String originUrl,
            @RequestParam("categoryName") @NotBlank String categoryName,
            @RequestParam("tagList") List<String> tagList) {
        String username = SecurityUtil.getUsername();
        BlogDTO dto = new BlogDTO(title, file, originalIsOrNot, originUrl, categoryName, tagList, username);
        blogService.saveBlog(dto);
        return Result.success();
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "查看博客")
    public Result queryBlog(@RequestParam("id") String id) {
        BlogVO vo = blogService.getBlog(id);
        return Result.success(vo);
    }
}

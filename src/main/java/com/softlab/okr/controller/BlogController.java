package com.softlab.okr.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.model.dto.BlogListDTO;
import com.softlab.okr.model.dto.BlogModifyDTO;
import com.softlab.okr.model.dto.UserBlogDTO;
import com.softlab.okr.model.vo.BlogDetailVO;
import com.softlab.okr.model.vo.BlogListVO;
import com.softlab.okr.model.vo.BlogVO;
import com.softlab.okr.model.vo.UserBlogVO;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.utils.Result;
import com.softlab.okr.utils.SecurityUtil;
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
            @RequestParam("originalName") @NotBlank String originalName,
            @RequestParam(value = "originUrl", required = false) String originUrl,
            @RequestParam("categoryName") @NotBlank String categoryName,
            @RequestParam("tagList") List<String> tagList) {
        String username = SecurityUtil.getUsername();
        BlogDTO dto = new BlogDTO(title, file, originalName, originUrl, categoryName, tagList, username);
        blogService.saveBlog(dto);
        return Result.success();
    }

    @PostMapping("change")
    @Auth(role = RoleConstants.COMMON, name = "修改博客信息")
    public Result changeBlog(
            @RequestParam("blogId") @NotNull String blogId,
            @RequestParam("title") @NotBlank String title,
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam("originalName") @NotBlank String originalName,
            @RequestParam(value = "originUrl", required = false) String originUrl,
            @RequestParam("statusName") @NotBlank String statusName,
            @RequestParam("publishName") @NotBlank String publishName,
            @RequestParam("categoryName") @NotBlank String categoryName,
            @RequestParam("comment") @NotBlank String comment,
            @RequestParam("tagList") List<String> tagList) {
        BlogModifyDTO dto = new BlogModifyDTO(blogId, title, file, originalName, originUrl, statusName, publishName,
                categoryName, comment, tagList);
        blogService.modifyBlog(dto);
        return Result.success();
    }

    @GetMapping("query")
    @Auth(role = RoleConstants.COMMON, name = "查看博客")
    public Result queryBlog(@RequestParam("blogId") String blogId) {
        BlogVO vo = blogService.getBlog(blogId);
        return Result.success(vo);
    }

    @GetMapping("detail")
    @Auth(role = RoleConstants.COMMON, name = "回显博客信息")
    public Result detailBlog(@RequestParam("blogId") String blogId) {
        BlogDetailVO vo = blogService.getBlogDetail(blogId);
        return Result.success(vo);
    }

    @GetMapping("cancel")
    @Auth(role = RoleConstants.ADMIN, name = "删除博客")
    public Result cancelBlog(@RequestParam("blogId") String blogId) {
        blogService.removeBlog(blogId);
        return Result.success();
    }

    @PostMapping("queryList")
    @Auth(role = RoleConstants.COMMON, name = "查看博客")
    public Result queryBlogList(@RequestBody BlogListDTO dto) {
        Page<BlogListVO> voPage = blogService.getBlogList(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @PostMapping("queryUserBlogList")
    @Auth(role = RoleConstants.COMMON, name = "查看博客")
    public Result queryUserBlogList(@RequestBody UserBlogDTO dto) {
        Page<UserBlogVO> voPage = blogService.getBlogUserList(dto);
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

}

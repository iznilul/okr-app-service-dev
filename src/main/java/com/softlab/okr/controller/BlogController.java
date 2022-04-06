package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 22:05
 **/
@RestController
@RequestMapping("/okr/blog")
@Api(tags = "博客接口")
public class BlogController {

    @Autowired
    private IBlogService blogService;

    @ApiOperation("更改接口开放状态")
    @GetMapping("upload")
    @Auth(role = RoleConstants.COMMON, name = "上传博客文件")
    public Result changeResource(@RequestParam("file") MultipartFile file){
        blogService.uploadMarkdown(file);
        return Result.success();
    }
}

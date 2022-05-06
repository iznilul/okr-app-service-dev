package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.vo.MenuVO;
import com.itlab.blog.service.IMenuService;
import com.itlab.blog.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-10-25 01:51
 **/
@RestController
@RequestMapping("/blog/menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @Auth(role = RoleConstants.USER, name = "获取路径")
    @GetMapping("fetch")
    public Result fetchMenu() {
        List<MenuVO> list = menuService.getMenu();
        return Result.success(list);
    }

}

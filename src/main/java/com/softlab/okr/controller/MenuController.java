package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.vo.MenuVO;
import com.softlab.okr.service.IMenuService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-25 01:51
 **/
@RestController
@RequestMapping("/okr/menu")
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

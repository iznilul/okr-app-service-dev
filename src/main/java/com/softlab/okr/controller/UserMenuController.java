package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.constant.RoleConstants;
import com.softlab.okr.model.vo.MenuVO;
import com.softlab.okr.service.IMenuService;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
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
@RequestMapping("/api/okr/menu")
@Api(tags = "用户 性能接口")
public class UserMenuController {

    @Autowired
    private IMenuService menuService;

    @Auth(resourceId = 131, role = RoleConstants.USER, name = "获取路径")
    @GetMapping("fetch")
    public Result queryRoute() {
        List<MenuVO> list = menuService.getMenu();
        return Result.success(list);
    }

}

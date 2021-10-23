package com.softlab.okr.controller.user;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.vo.RouteVO;
import com.softlab.okr.service.IRouteService;
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
@RequestMapping("/api/user/route")
@Api(tags = "用户 性能接口")
@Auth(id = 3700, name = "用户 路径接口")
public class UserRouteController {

    @Autowired
    private IRouteService routeService;

    @Auth(id = 1, name = "获取路径")
    @GetMapping("query")
    public Result queryRoute() {
        List<RouteVO> list = routeService.getRoutes();
        return list.size() > 0 ? Result.success(list) : Result.failure();
    }

}

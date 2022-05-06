package com.itlab.blog.controller;

import com.itlab.blog.annotation.Auth;
import com.itlab.blog.constant.RoleConstants;
import com.itlab.blog.model.monitor.Server;
import com.itlab.blog.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/blog/monitor")
public class MonitorController {

    @GetMapping("server")
    @Auth(role = RoleConstants.USER, name = "服务器监控")
    public Result server() throws Exception {
        Server server = new Server();
        server.copyTo();
        return Result.success(server);
    }

}

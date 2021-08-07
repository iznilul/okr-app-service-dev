package com.softlab.okr.controller;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.model.monitor.Server;
import com.softlab.okr.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 13:47
 **/
@RestController
@RequestMapping("/api/user/monitor")
@Api(tags = "监控操作")
@Auth(id = 3000, name = "监控操作")
public class MonitorController {

    @GetMapping("/server")
    @ApiOperation("服务器监控")
    @Auth(id = 1, name = "服务器监控")
    public Result server() throws Exception {
        Server server = new Server();
        server.copyTo();
        return Result.success(server);
    }

}

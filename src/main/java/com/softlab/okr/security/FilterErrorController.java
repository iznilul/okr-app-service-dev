package com.softlab.okr.security;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 21:49
 **/

@Api(tags = "处理过滤器层异常")
@RestController
public class FilterErrorController {

  @RequestMapping("/error/throw")
  @ApiOperation("抛出异常")
  public void rethrow(HttpServletRequest request) throws Exception {
    throw ((Exception) request.getAttribute("filter.error"));
  }
}

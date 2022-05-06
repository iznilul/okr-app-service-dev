package com.itlab.blog.model.exception;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-05 21:49
 **/

@RestController
public class FilterErrorController {

    @RequestMapping("/error/throw")
    public void rethrow(HttpServletRequest request) {
        throw ((BusinessException) request.getAttribute("filter.error"));
    }
}

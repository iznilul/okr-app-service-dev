package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Blog;
import com.itlab.blog.model.dto.BlogDTO;
import com.itlab.blog.model.dto.BlogListDTO;
import com.itlab.blog.model.dto.BlogModifyDTO;
import com.itlab.blog.model.dto.UserBlogDTO;
import com.itlab.blog.model.vo.BlogDetailVO;
import com.itlab.blog.model.vo.BlogListVO;
import com.itlab.blog.model.vo.BlogVO;
import com.itlab.blog.model.vo.UserBlogVO;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.Future;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
public interface IBlogService extends IService<Blog> {

    void saveBlog(BlogDTO dto);

    BlogVO getBlog(String id);

    BlogDetailVO getBlogDetail(String id);

    Page<BlogListVO> getBlogList(BlogListDTO dto);

    Page<UserBlogVO> getBlogUserList(UserBlogDTO dto);

    void removeBlog(String id);

    void modifyBlog(BlogModifyDTO dto);

    @Async
    Future<Integer> incr(Blog blog);
}

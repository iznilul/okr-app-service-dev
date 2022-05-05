package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Blog;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.model.dto.BlogListDTO;
import com.softlab.okr.model.dto.BlogModifyDTO;
import com.softlab.okr.model.dto.UserBlogDTO;
import com.softlab.okr.model.vo.BlogDetailVO;
import com.softlab.okr.model.vo.BlogListVO;
import com.softlab.okr.model.vo.BlogVO;
import com.softlab.okr.model.vo.UserBlogVO;
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

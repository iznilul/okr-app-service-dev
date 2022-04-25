package com.softlab.okr.service;

import com.softlab.okr.entity.Blog;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.model.dto.BlogDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
public interface IBlogService extends IService<Blog> {

    void saveBlog(BlogDTO dto);

    Map<String, Object> getBlog(String id);
}

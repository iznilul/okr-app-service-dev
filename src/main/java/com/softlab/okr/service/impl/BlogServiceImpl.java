package com.softlab.okr.service.impl;

import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.Blog;
import com.softlab.okr.entity.Book;
import com.softlab.okr.mapper.BlogMapper;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.IBlogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.utils.FileUtil;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {


    @Override
    public void saveBlog(BlogDTO dto) {
        MultipartFile file = dto.getFile();
        String fileName = file.getOriginalFilename();
        if (!FileUtil.isMarkdown(fileName)) {
            throw new BusinessException("请上传md格式文件");
        }
        String html = null;
        try {
            html = FileUtil.markdownToHtml(file);
        } catch (IOException e) {
            log.error(e.toString());
            throw new BusinessException("markdown文件解析错误");
        }
    }

    @Override
    @Cacheable(cacheNames = EntityNames.BOOK + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Map<String, Object> getBlog(String id) {
        Map<String, Object> map = new HashMap<>();
        List<Book> list = new ArrayList<>();
        Book book = new Book(1, "1", "1", "1", 1);
        list.add(book);
        map.put("shit", list);
        return map;
    }


}

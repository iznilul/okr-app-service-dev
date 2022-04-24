package com.softlab.okr.service.impl;

import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.Book;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.service.IBlogService;
import com.softlab.okr.utils.FileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2022-04-06 17:22
 **/
@Service
@Slf4j
public class BlogServiceImpl implements IBlogService {

    @Override
    public void uploadMarkdown(MultipartFile file) {
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

package com.softlab.okr.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface IBlogService {

    void uploadMarkdown(MultipartFile file);

    Map<String,Object> getBlog(String id);
}

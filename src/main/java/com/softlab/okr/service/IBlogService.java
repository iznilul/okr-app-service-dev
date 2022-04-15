package com.softlab.okr.service;

import org.springframework.web.multipart.MultipartFile;

public interface IBlogService {
    void uploadMarkdown(MultipartFile file);
}

package com.itlab.blog.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogModifyDTO {
    private String blogId;
    private String title;
    private MultipartFile file;
    private String originalName;
    private String originUrl;
    private String statusName;
    private String publishName;
    private String categoryName;
    private String comment;
    private List<String> tagList;
}

package com.softlab.okr.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlogDTO {

    //@NotBlank(message = "博客标题不能为空")
    private String title;
    private MultipartFile file;
    //@Range(min = 0, max = 1, message = "参数需为0或1")
    private String originalIsOrNot;
    private String originUrl;
    private String categoryName;
    private List<String> tagList;
    private String username;
}

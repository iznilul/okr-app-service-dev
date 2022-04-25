package com.softlab.okr.model.dto;

import com.softlab.okr.entity.Tag;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
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
    private Integer originalIsOrNot;
    private String originUrl;
    private String categoryName;
    private List<Tag> tagList;

}

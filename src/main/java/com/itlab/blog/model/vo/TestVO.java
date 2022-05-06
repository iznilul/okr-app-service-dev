package com.itlab.blog.model.vo;

import com.itlab.blog.entity.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2022-04-24 16:56
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private List<Book> list;

}

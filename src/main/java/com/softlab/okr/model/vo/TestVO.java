package com.softlab.okr.model.vo;

import com.softlab.okr.entity.Book;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Program: okr
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

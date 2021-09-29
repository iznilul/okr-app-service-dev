package com.softlab.okr.model.dto;

import com.softlab.okr.entity.Book;
import com.softlab.okr.entity.Tag;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-29 17:43
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookDTO {

  private Book book;
  private List<Tag> tagList;
}

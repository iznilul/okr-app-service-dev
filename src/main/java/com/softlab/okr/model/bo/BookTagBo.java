package com.softlab.okr.model.bo;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 15:23
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookTagBo {

  private Integer bookId;
  private List<Integer> tagIds;
}

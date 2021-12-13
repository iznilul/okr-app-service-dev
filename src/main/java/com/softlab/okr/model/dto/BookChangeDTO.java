package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
@ApiModel("BookDto 书籍接口类")
public class BookChangeDTO {

    @NotNull(message = "bookId不能为空")
    private Integer bookId;
    private String bookName;
    private String img;
    private String publisher;
    private String statusName;
    private List<String> tagList;

}

package com.softlab.okr.model.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-07 21:59
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("BookDto 书籍接口传输类")
public class BookQueryDTO extends PageDTO {

    @ApiModelProperty(value = "书名", required = true, example = "java从入门到跑路")
    private String bookName;

    @ApiModelProperty(value = "出版社", required = true, example = "机械工业出版社")
    private String publisher;

}

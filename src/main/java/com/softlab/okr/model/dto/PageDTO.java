package com.softlab.okr.model.dto;

import lombok.Data;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 16:31
 **/
@Data
public class PageDTO {

    private Integer index;

    private Integer pageSize;

    public Integer getIndex() {
        return index = index == null ? 1 : index;
    }

    public Integer getPageSize() {
        return pageSize = pageSize == null ? 10 : pageSize;
    }
}

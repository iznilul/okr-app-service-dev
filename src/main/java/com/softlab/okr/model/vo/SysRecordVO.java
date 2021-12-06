package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-30 14:47
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysRecordVO {

    private String name;
    private String path;
    private String username;
    private String ip;
    private String updateTime;
    private long duration;
}

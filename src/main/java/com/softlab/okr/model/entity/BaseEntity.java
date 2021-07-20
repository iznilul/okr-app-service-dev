package com.softlab.okr.model.entity;

import lombok.Data;

/**
 * 基础实体类，所有实体对象集成此类
 *
 * @author RudeCrab
 */

@Data
public abstract class BaseEntity {
    /**
     * 主键
     */
    private Integer id;
    private long createTime;
    private long updateTime;
}

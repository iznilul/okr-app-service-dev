package com.itlab.blog.entity;

import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
@Data
public class Menu {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Integer menuId;

    /**
     * 父路径id，id为0代表为父路径
     */
    private Integer parentId;

    /**
     * 路径
     */
    private String path;

    /**
     * 名称
     */
    private String name;

    /**
     * 文本内容
     */
    private String text;

    /**
     * icon类型
     */
    private String type;

    /**
     * icon大小
     */
    private String size;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 外链
     */
    private Integer external;

    /**
     * 外链地址
     */
    private String url;

    /**
     * 隐藏
     */
    private Integer hidden;

    /**
     * 角色id
     */
    private Integer roleId;
}

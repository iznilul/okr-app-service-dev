package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.List;

/**
 * 博客表
 *
 * @author 陌溪
 * @date 2018-09-08
 */
@Data
@TableName("t_blog")
public class Blog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一oid【自动递增】
     */
    private Integer blogId;

    /**
     * 博客标题
     */
    private String title;

    /**
     * 博客内容
     */
    private String content;

    /**
     * 博客点击数
     */
    private Integer clickCount;

    /**
     * 是否发布
     */
    private String isPublish;

    /**
     * 是否原创
     */
    private String isOriginal;

    /**
     * 如果原创，作者为管理员名
     */
    private String userName;

    /**
     * 文章出处
     */
    private String articlesPart;

    /**
     * 推荐级别，用于首页推荐
     * 0：正常
     * 1：一级推荐(轮播图)
     * 2：二级推荐(top)
     * 3：三级推荐 ()
     * 4：四级 推荐 (特别推荐)
     */
    private Integer level;
}

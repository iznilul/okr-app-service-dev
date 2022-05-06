package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class Blog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "blog_id", type = IdType.AUTO)
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
     * 是否对外展示
     */
    private Integer publishIsOrNot;

    /**
     * 是否原创
     */
    private Integer originalIsOrNot;

    /**
     * 发布者账号
     */
    private String username;

    /**
     * 类别id
     */
    private Integer categoryId;

    /**
     * 文章原出处
     */
    private String originUrl;

    /**
     * 评分  0：未评分 1：不及格  2：及格  3：良好  4：优秀
     */
    private Integer status;

    /**
     * 评论
     */
    private String comment;


}

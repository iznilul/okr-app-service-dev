package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-21
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CsdnSpider {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 标题
     */
    private String articleTitle;

    /**
     * 点击量
     */
    private String viewCount;

    /**
     * url
     */
    private String articleDetailUrl;


}

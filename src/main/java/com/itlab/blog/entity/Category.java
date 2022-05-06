package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
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
public class Category {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(value = "category_id", type = IdType.AUTO)
    private Integer categoryId;

    /**
     * 类别名称
     */
    private String name;

    /**
     * 排序权重
     */
    private Integer weight;

    @TableLogic
    private Integer deleteFlag;


}

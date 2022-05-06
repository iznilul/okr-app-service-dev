package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-12-13
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookUser {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 书籍id
     */
    private Integer bookId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 状态 0未归还 1已归还
     */
    private Integer status;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    public Date updateTime;


}

package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description:
 * @author: radCircle
 * @create: 2021-08-18 23:25
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tag {

    private static final long serialVersionUID = 1L;

    @TableId(value = "tag_id", type = IdType.AUTO)
    private Integer tagId;
    private String name;
    private Integer weight;
    @TableLogic
    private Integer deleteFlag;
}

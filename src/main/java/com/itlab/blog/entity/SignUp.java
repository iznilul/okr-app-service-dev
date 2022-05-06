package com.itlab.blog.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignUp {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String studentId;
    private String name;
    private String gender;
    private String qq;
    private String major;
    private String profile;
    private Integer status;
    private String comment;

    @TableField(fill = FieldFill.INSERT)
    public Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    public Date updateTime;
}

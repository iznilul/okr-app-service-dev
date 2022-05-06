package com.itlab.blog.model.enums;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 12:07
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum BookUserEnum implements BaseEnum {
    NOT_RETURN(0, "未归还"),
    RETURNED(1, "已归还");

    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (BookUserEnum status : BookUserEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (BookUserEnum status : BookUserEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

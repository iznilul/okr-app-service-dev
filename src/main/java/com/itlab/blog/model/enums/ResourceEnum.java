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
public enum ResourceEnum implements BaseEnum {
    CLOSE(0, "关闭"),
    OPEN(1, "开启");


    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (ResourceEnum status : ResourceEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (ResourceEnum status : ResourceEnum.values()) {
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

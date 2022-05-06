package com.itlab.blog.model.enums;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 12:07
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum UserStatusEnum implements BaseEnum {
    EXAMINE(0, "考核中"),
    SUCCESS(1, "考核通过"),
    FAIL(2, "考核未过");

    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (UserStatusEnum status : UserStatusEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (UserStatusEnum status : UserStatusEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (UserStatusEnum statusEnum : UserStatusEnum.values()) {
            list.add(statusEnum.message);
        }
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

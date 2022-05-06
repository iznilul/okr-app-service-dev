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
public enum PublishIsOrNotEnum implements BaseEnum {
    NOT_PUBLISH(0, "未发布"),
    PUBLISHED(1, "已发布");

    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (PublishIsOrNotEnum status : PublishIsOrNotEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (PublishIsOrNotEnum status : PublishIsOrNotEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (PublishIsOrNotEnum status : PublishIsOrNotEnum.values()) {
            list.add(status.message);
        }
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

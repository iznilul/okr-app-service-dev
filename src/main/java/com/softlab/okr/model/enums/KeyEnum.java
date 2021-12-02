package com.softlab.okr.model.enums;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 12:07
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum KeyEnum implements BaseEnum {
    NORMAL(0, "空闲"),
    BORROWED(1, "有人保管"),
    LOST(2, "已丢失");


    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (KeyEnum status : KeyEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (KeyEnum status : KeyEnum.values()) {
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

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (KeyEnum status : KeyEnum.values()) {
            list.add(status.message);
        }
        return list;
    }

}

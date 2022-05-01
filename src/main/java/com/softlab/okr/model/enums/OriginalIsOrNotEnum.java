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
public enum OriginalIsOrNotEnum implements BaseEnum {
    NOT_ORIGINAL(0, "非原创"),
    ORIGINAL(1, "原创");

    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (OriginalIsOrNotEnum status : OriginalIsOrNotEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (OriginalIsOrNotEnum status : OriginalIsOrNotEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (OriginalIsOrNotEnum status : OriginalIsOrNotEnum.values()) {
            list.add(status.message);
        }
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

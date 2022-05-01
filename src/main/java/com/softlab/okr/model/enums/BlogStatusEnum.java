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
public enum BlogStatusEnum implements BaseEnum {
    NOT_SCORED(0, "未评分"),
    FAILED(1, "不及格"),
    PASS(2, "及格"),
    GOOD(3, "良好"),
    EXCELLENT(4, "优秀");

    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (BlogStatusEnum status : BlogStatusEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (BlogStatusEnum status : BlogStatusEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (BlogStatusEnum status : BlogStatusEnum.values()) {
            list.add(status.message);
        }
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

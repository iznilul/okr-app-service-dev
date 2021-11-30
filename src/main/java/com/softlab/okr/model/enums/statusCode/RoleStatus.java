package com.softlab.okr.model.enums.statusCode;

import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 12:07
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum RoleStatus implements BaseCode {
    SUPER_ADMIN(1, "超级管理员", "superAdmin"),
    ADMIN(2, "管理员", "admin"),
    USER(3, "普通用户", "user");

    private Integer code;
    private String message;
    private String role;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }

    public String role() {
        return this.role;
    }


    public static String getMessage(Integer code) {
        for (RoleStatus status : RoleStatus.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (RoleStatus status : RoleStatus.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static String getRole(String message) {
        for (RoleStatus status : RoleStatus.values()) {
            if (status.message.equals(message)) {
                return status.role;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (RoleStatus status : RoleStatus.values()) {
            list.add(status.message);
        }
        return list;
    }

    public static List<RoleStatus> getListOrderByAsc() {
        List<RoleStatus> list = Arrays.asList(RoleStatus.values());
        list.sort(Comparator.comparingInt(s -> s.code));
        return list;
    }

    public static List<RoleStatus> getListOrderByDesc() {
        List<RoleStatus> list = Arrays.asList(RoleStatus.values());
        list.sort((s1, s2) -> -(s1.code - s2.code));
//        List<RoleStatus> list = RoleStatus.getListOrderByAsc();
//        list.sort(Comparator.reverseOrder());
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

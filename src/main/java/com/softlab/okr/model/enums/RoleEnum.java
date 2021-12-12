package com.softlab.okr.model.enums;

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
public enum RoleEnum implements BaseEnum {
    SUPER_ADMIN(1, "超级管理", "superAdmin"),
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
        for (RoleEnum status : RoleEnum.values()) {
            if (status.code.equals(code)) {
                return status.message;
            }
        }
        return null;
    }

    public static String getMessage(String role) {
        for (RoleEnum status : RoleEnum.values()) {
            if (status.role.equals(role)) {
                return status.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (RoleEnum status : RoleEnum.values()) {
            if (status.message.equals(message)) {
                return status.code;
            }
        }
        return null;
    }

    public static String getRole(String message) {
        for (RoleEnum status : RoleEnum.values()) {
            if (status.message.equals(message)) {
                return status.role;
            }
        }
        return null;
    }

    public static String getRole(Integer code) {
        for (RoleEnum status : RoleEnum.values()) {
            if (status.code.equals(code)) {
                return status.role;
            }
        }
        return null;
    }

    public static List<String> getList() {
        List<String> list = new ArrayList<>();
        for (RoleEnum status : RoleEnum.values()) {
            list.add(status.message);
        }
        return list;
    }

    public static List<RoleEnum> getListOrderByAsc() {
        List<RoleEnum> list = Arrays.asList(RoleEnum.values());
        list.sort(Comparator.comparingInt(s -> s.code));
        return list;
    }

    public static List<RoleEnum> getListOrderByDesc() {
        List<RoleEnum> list = Arrays.asList(RoleEnum.values());
        list.sort((s1, s2) -> -(s1.code - s2.code));
        return list;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }

}

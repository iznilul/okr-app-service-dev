package com.softlab.okr.model.enums;


import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public enum ReturnEnum implements BaseEnum {
    SUCCESS(200, "请求成功"),
    FAIL(400, "请求失败"),
    UNAUTHORIZED(401, "请求未认证"),
    ROLE_EXPIRED(418, "权限过期"),//从418开始自定义，因为417以上官方定了
    TOKEN_EXPIRED(419, "令牌过期"),
    ERROR(500, "服务系统错误");


    private Integer code;
    private String message;

    public Integer code() {
        return this.code;
    }

    public String message() {
        return this.message;
    }


    public static String getMessage(Integer code) {
        for (ReturnEnum r : ReturnEnum.values()) {
            if (r.code.equals(code)) {
                return r.message;
            }
        }
        return null;
    }

    public static Integer getCode(String message) {
        for (ReturnEnum r : ReturnEnum.values()) {
            if (r.message.equals(message)) {
                return r.code;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return this.code().toString() + " " + this.message();
    }
}

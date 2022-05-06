package com.itlab.blog.model.enums;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public enum CacheKeyUnitEnum {
    SECOND("s", "秒"),
    MINUTE("m", "分钟"),
    HOUR("h", "小时"),
    DAY("d", "天");

    private String code;
    private String message;

    public String getCode() {
        return this.code;
    }

    public String getMessage() {
        return this.message;
    }
}

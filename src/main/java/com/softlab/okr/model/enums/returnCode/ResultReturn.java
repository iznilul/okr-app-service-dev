package com.softlab.okr.model.enums.returnCode;

import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:状态码
 * @author: radCircle
 * @ create: 2021-07-02 12:15
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum ResultReturn implements BaseCode {
  SQL_ERROR(1005, "sql语句错误"),
  API_ERROR(1006, "请求接口暂时未开启"),
  QUERY_SIGNUP_ERROR(2002, "查无此人");

  private Integer code;

  private String message;

  public Integer code() {
    return this.code;
  }

  public String message() {
    return this.message;
  }

  public static String getMessage(String name) {
    for (ResultReturn item : ResultReturn.values()) {
      if (item.name().equals(name)) {
        return item.message;
      }
    }
    return name;
  }

  public static Integer getCode(String name) {
    for (ResultReturn item : ResultReturn.values()) {
      if (item.name().equals(name)) {
        return item.code;
      }
    }
    return null;
  }

  @Override
  public String toString() {
    return this.code().toString() + " " + this.message();
  }
}
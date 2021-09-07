package com.softlab.okr.model.enums.returnCode;


import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public enum LoginReturn implements BaseCode {
  LOGIN_SUCCESS(1001, "登陆成功"),
  LOGIN_FAIL(1002, "登陆失败"),
  USER_NOT_FOUND(1003, "未找到用户"),
  USER_EXIST(1004, "用户已存在");


  private Integer code;
  private String message;

  public Integer code() {
    return this.code;
  }

  public String message() {
    return this.message;
  }


  public static String getMessage(Integer code) {
    for (LoginReturn r : LoginReturn.values()) {
      if (r.code.equals(code)) {
        return r.message;
      }
    }
    return null;
  }

  public static Integer getCode(String message) {
    for (LoginReturn r : LoginReturn.values()) {
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

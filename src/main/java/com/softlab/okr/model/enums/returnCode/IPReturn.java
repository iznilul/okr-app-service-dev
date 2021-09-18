package com.softlab.okr.model.enums.returnCode;


import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public enum IPReturn implements BaseCode {
  TOO_FAST(5001, "请求频率太快"),
  BLACK_LIST(5002, "您已进入黑名单，请稍后再进行请求");


  private Integer code;
  private String message;

  public Integer code() {
    return this.code;
  }

  public String message() {
    return this.message;
  }


  public static String getMessage(Integer code) {
    for (IPReturn r : IPReturn.values()) {
      if (r.code.equals(code)) {
        return r.message;
      }
    }
    return null;
  }

  public static Integer getCode(String message) {
    for (IPReturn r : IPReturn.values()) {
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

package com.softlab.okr.model.enums.returnCode;


import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public enum CommonReturn implements BaseCode {
  SUCCESS(200, "请求成功"),
  FAIL(400, "请求失败");


  private Integer code;
  private String message;

  public Integer code() {
    return this.code;
  }

  public String message() {
    return this.message;
  }


  public static String getMessage(Integer code) {
    for (CommonReturn r : CommonReturn.values()) {
      if (r.code.equals(code)) {
        return r.message;
      }
    }
    return null;
  }

  public static Integer getCode(String message) {
    for (CommonReturn r : CommonReturn.values()) {
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

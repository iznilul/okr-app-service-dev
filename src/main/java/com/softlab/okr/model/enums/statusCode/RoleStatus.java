package com.softlab.okr.model.enums.statusCode;

import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-08 12:07
 **/
@AllArgsConstructor
@NoArgsConstructor
public enum RoleStatus implements BaseCode {
  ADMIN(1, "管理员", "admin"),
  MEMBER(2, "普通用户", "user");

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

  @Override
  public String toString() {
    return this.code().toString() + " " + this.message();
  }

}

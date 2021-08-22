package com.softlab.okr.utils;

/**
 * @program: okr
 * @description:状态码
 * @author: radCircle
 * @ create: 2021-07-02 12:15
 **/
public enum ResultCode {

  /* 成功状态码 */
  SUCCESS(200, "成功"),

  /* 参数错误：1001-1999 */
  PARAM_NOT_COMPLETE(1001, "请求参数异常"),

  /* 接口错误：2001-2999*/
  USER_NOT_LOGGED_IN(2001, "用户未登录"),
  USER_LOGIN_ERROR(2002, "账号不存在或密码错误"),
  USER_username_FORBIDDEN(2003, "账号已被禁用"),
  USER_TOKEN_EXPIRE(2004, "用户令牌已过期或不合法"),
  USER_HAS_EXISTED(2005, "用户已存在"),
  USER_REGISTER_ERROR(2006, "用户注册失败"),
  USER_UPDATE_ERROR(2007, "用户信息更新失败"),
  USER_UPLOAD_ERROR(2008, "用户上传文件失败"),
  USER_UPLOAD_EXCEED(2009, "用户上传文件太大"),
  SIGNUP_NOT_OPEN(2010, "报名未开启"),
  SIGNUP_ERROR(2011, "报名失败，请重新报名或联系网站管理员"),
  API_NOT_OPEN(2012, "查询接口未开启"),
  QUERY_ERROR(2013, "查无此人，请先报名或联系网站管理员"),
  SWITCH_ERROR(2014, "接口更改失败"),
  SIGNUP_MODIFY_ERROR(2015, "报名信息更新失败"),

  /* 未知错误：3001-3999 */
  UNKNOWN_ERROR(3001, "不知名错误，请联系开发者"),

  /* 系统错误：4001-4999 */
  SYSTEM_INNER_ERROR(4001, "系统错误"),

  /* dao层数据错误：5001-5999 */
  MAPPER_ERROR(5001, "数据库交互错误"),
  BAD_SQL_ERROR(5002, "sql语句错误"),
  IBATIS_ERROR(5003, "  持久化层错误"),

  /* service接口错误：6001-6999 */
  SERVICE_ERROR(6001, "服务接口错误"),

  /* 权限错误：7001-7999 */
  PERMISSION_NO_ACCESS(7001, "无访问权限"),

  /* IO错误：8001-8999 */
  IO_ERROR(8001, "输入输出异常");

  private Integer code;

  private String message;

  ResultCode(Integer code, String message) {
    this.code = code;
    this.message = message;
  }

  public Integer code() {
    return this.code;
  }

  public String message() {
    return this.message;
  }

  public static String getMessage(String name) {
    for (ResultCode item : ResultCode.values()) {
      if (item.name().equals(name)) {
        return item.message;
      }
    }
    return name;
  }

  public static Integer getCode(String name) {
    for (ResultCode item : ResultCode.values()) {
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
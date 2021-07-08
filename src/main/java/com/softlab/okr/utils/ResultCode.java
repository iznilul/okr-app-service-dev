package com.softlab.okr.utils;

/**
 * @program: okr
 * @description:状态码
 * @author: radCircle
 * @
 * create: 2021-07-02 12:15
 **/
public enum ResultCode {

    /* 成功状态码 */
    SUCCESS(200, "成功"),

    /* 参数错误：1001-1999 */
    PARAM_IS_INVALID(1001, "参数无效"),
    PARAM_IS_BLANK(1002, "参数为空"),
    PARAM_TYPE_BIND_ERROR(1003, "参数类型错误"),
    PARAM_NOT_COMPLETE(1004, "参数缺失"),

    /* 用户错误：2001-2999*/
    USER_NOT_LOGGED_IN(2001, "用户未登录"),
    USER_LOGIN_ERROR(2002, "账号不存在或密码错误"),
    USER_ACCOUNT_FORBIDDEN(2003, "账号已被禁用"),
    USER_NOT_EXIST(2004, "用户不存在"),
    USER_HAS_EXISTED(2005, "用户已存在"),
    USER_REGISTER_ERROR(2006, "用户注册失败"),
    USER_UPDATE_ERROR(2007, "用户信息更新失败"),
    USER_UPLOAD_ERROR(2008, "用户上传文件失败"),
    USER_UPLOAD_EXCEED(2009, "用户上传文件太大"),

    /* 未知错误：3001-3999 */
    UNKNOWN_ERROR(3001, "服务出错，请联系开发者"),

    /* 系统错误：4001-4999 */
    SYSTEM_INNER_ERROR(4001, "系统繁忙，请稍后重试"),

    /* 数据错误：5001-5999 */
    RESULT_DATA_NONE(5001, "数据未找到"),
    DATA_IS_WRONG(5002, "数据有误"),
    DATA_ALREADY_EXISTED(5003, "数据已存在"),
    DATA_STATUS_STOP(5004, "数据状态已停用"),
    DATA_STATUS_START(5005, "数据状态已启用"),

    /* 接口错误：6001-6999 */
    INTERFACE_INNER_INVOKE_ERROR(6001, "内部系统接口调用异常"),
    INTERFACE_OUTTER_INVOKE_ERROR(6002, "外部系统接口调用异常"),
    INTERFACE_FORBID_VISIT(6003, "该接口禁止访问"),
    INTERFACE_ADDRESS_INVALID(6004, "接口地址无效"),
    INTERFACE_REQUEST_TIMEOUT(6005, "接口请求超时"),
    INTERFACE_EXCEED_LOAD(6006, "接口负载过高"),

    /* 权限错误：7001-7999 */
    PERMISSION_NO_ACCESS(7001, "无访问权限");

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
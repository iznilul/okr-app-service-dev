package com.softlab.okr.utils;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @program: okr
 * @description: 返回类
 * @author: radCircle
 * @create: 2021-07-02 12:13
 **/

@Data
@ApiModel("Result 统一API响应结果封装")
public class Result {
    @ApiModelProperty(value = "成功失败的标志", required = true, example = "200")
    private Integer code;
    @ApiModelProperty(value = "成功失败的响应信息", required = true)
    private String msg;
    @ApiModelProperty(value = "成功失败的响应数据", required = false)
    private Object data;

    public Result() {
    }

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Result(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static Result success() {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        return result;
    }

    public static Result success(Object data) {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        result.setData(data);
        return result;
    }

    public static Result failure(ResultCode resultCode) {
        Result result = new Result();
        result.setResultCode(resultCode);
        return result;
    }

    public static Result failure(ResultCode resultCode, Object data) {
        Result result = new Result();
        result.setResultCode(resultCode);
        result.setData(data);
        return result;
    }

    private void setResultCode(ResultCode code) {
        this.code = code.code();
        this.msg = code.message();
    }


}
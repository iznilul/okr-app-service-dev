package com.softlab.okr.utils;

import com.softlab.okr.model.enums.BaseEnum;
import com.softlab.okr.model.enums.ReturnEnum;
import com.softlab.okr.model.exception.BusinessException;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description: 返回类
 * @author: radCircle
 * @create: 2021-07-02 12:13
 **/

@Data
@ApiModel("Result 统一API响应结果封装")
@AllArgsConstructor
@NoArgsConstructor
public class Result {

    @ApiModelProperty(value = "标志", required = true, example = "200")
    private Integer code;
    @ApiModelProperty(value = "响应信息", required = true)
    private String msg;
    @ApiModelProperty(value = "响应数据", required = false)
    private Object data;
    @ApiModelProperty(value = "当前页目录", required = false)
    private Long current;
    @ApiModelProperty(value = "数据数量", required = false)
    private Long total;

    public Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static Result success() {
        Result result = new Result();
        result.setResultCode(ReturnEnum.SUCCESS);
        return result;
    }

    public static Result success(Object data) {
        Result result = new Result();
        result.setResultCode(ReturnEnum.SUCCESS);
        result.setData(data);
        return result;
    }

    public static Result success(Object data, Long current, Long total) {
        Result result = new Result();
        result.setResultCode(ReturnEnum.SUCCESS);
        result.setData(data);
        result.setCurrent(current);
        result.setTotal(total);
        return result;
    }

    public static Result failure() {
        Result result = new Result();
        result.setResultCode(ReturnEnum.FAIL);
        return result;
    }

    public static Result failure(BaseEnum baseEnum) {
        Result result = new Result();
        result.setResultCode(baseEnum);
        return result;
    }

    public static Result failure(String message) {
        Result result = new Result();
        result.setCode(ReturnEnum.FAIL.code());
        result.setMsg(message);
        return result;
    }

    public static Result failure(BusinessException e) {
        Result result = new Result();
        result.setCode(e.getCode());
        result.setMsg(e.getMessage());
        return result;
    }


    public static Result failure(BaseEnum baseEnum, Object data) {
        Result result = new Result();
        result.setResultCode(baseEnum);
        result.setData(data);
        return result;
    }

    private void setResultCode(BaseEnum baseEnum) {
        this.code = baseEnum.code();
        this.msg = baseEnum.message();
    }


}
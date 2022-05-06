package com.itlab.blog.utils;

import com.itlab.blog.model.enums.BaseEnum;
import com.itlab.blog.model.enums.ReturnEnum;
import com.itlab.blog.model.exception.BaseException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: blog
 * @description: 返回类
 * @author: radCircle
 * @create: 2021-07-02 12:13
 **/

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result {


    private Integer code;

    private String msg;

    private Object data;

    private Long current;

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

    public static Result failure(BaseException e) {
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
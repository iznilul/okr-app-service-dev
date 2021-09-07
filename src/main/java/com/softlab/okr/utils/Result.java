package com.softlab.okr.utils;

import com.softlab.okr.model.enums.BaseCode;
import com.softlab.okr.model.enums.returnCode.CommonReturn;
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

  @ApiModelProperty(value = "成功失败的标志", required = true, example = "200")
  private Integer code;
  @ApiModelProperty(value = "成功失败的响应信息", required = true)
  private String msg;
  @ApiModelProperty(value = "成功失败的响应数据", required = false)
  private Object data;

  public Result(Integer code, String msg) {
    this.code = code;
    this.msg = msg;
  }

  public static Result success() {
    Result result = new Result();
    result.setResultCode(CommonReturn.SUCCESS);
    return result;
  }

  public static Result success(Object data) {
    Result result = new Result();
    result.setResultCode(CommonReturn.SUCCESS);
    result.setData(data);
    return result;
  }

  public static Result failure() {
    Result result = new Result();
    result.setResultCode(CommonReturn.FAIL);
    return result;
  }

  public static Result failure(BaseCode baseCode) {
    Result result = new Result();
    result.setResultCode(baseCode);
    return result;
  }

  public static Result failure(BaseCode baseCode, Object data) {
    Result result = new Result();
    result.setResultCode(baseCode);
    result.setData(data);
    return result;
  }

  private void setResultCode(BaseCode baseCode) {
    this.code = baseCode.code();
    this.msg = baseCode.message();
  }


}
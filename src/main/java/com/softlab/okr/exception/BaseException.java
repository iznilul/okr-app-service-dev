package com.softlab.okr.exception;

import com.softlab.okr.model.enums.BaseCode;
import com.softlab.okr.model.enums.returnCode.CommonReturn;
import lombok.Data;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-17 17:07
 **/
@Data
public class BaseException extends RuntimeException {

  private BaseCode baseCode;

  public BaseException() {
    super(CommonReturn.FAIL.message());
    this.baseCode = CommonReturn.FAIL;
  }

  public BaseException(BaseCode baseCode) {
    super(baseCode.message());
    this.baseCode = baseCode;
  }
}

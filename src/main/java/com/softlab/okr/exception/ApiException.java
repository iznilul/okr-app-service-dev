package com.softlab.okr.exception;

import com.softlab.okr.model.enums.BaseCode;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-08 02:04
 **/
@Data
@NoArgsConstructor
public class ApiException extends BaseException {

  public ApiException(BaseCode baseCode) {
    super(baseCode);
  }
}
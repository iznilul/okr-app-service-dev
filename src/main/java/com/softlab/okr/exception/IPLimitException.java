package com.softlab.okr.exception;

import com.softlab.okr.model.enums.BaseCode;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-17 16:47
 **/
@Data
@NoArgsConstructor
public class IPLimitException extends BaseException {

  public IPLimitException(BaseCode baseCode) {
    super(baseCode);
  }
}

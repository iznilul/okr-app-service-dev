package com.softlab.okr.exception;

import com.softlab.okr.model.enums.BaseCode;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-18 14:41
 **/
public class BlackListException extends BaseException {

  public BlackListException(BaseCode baseCode) {
    super(baseCode);
  }
}

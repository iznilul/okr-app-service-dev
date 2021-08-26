package com.softlab.okr.convert;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-08-26 17:20
 **/
public interface ConvertService<E, T> {

  T convertVO(E e);
}

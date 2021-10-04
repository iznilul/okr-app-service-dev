package com.softlab.okr.model.vo;

import com.softlab.okr.model.enums.BaseCode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-04 03:02
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StatusVO {

  private BaseCode[] baseCode;
}

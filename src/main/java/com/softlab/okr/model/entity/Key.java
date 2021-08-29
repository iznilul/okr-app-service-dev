package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-08-29 22:31
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Key {
    private Integer keyId;
    private String keyName;
}

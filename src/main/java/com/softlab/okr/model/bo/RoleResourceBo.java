package com.softlab.okr.model.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-19 15:10
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleResourceBo {
    private Integer roleId;
    private List<Integer> resourceIds;
}

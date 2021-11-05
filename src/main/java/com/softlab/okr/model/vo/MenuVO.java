package com.softlab.okr.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author RudeCrab
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVO {

    private Integer menuId;
    private String name;
    private String path;
    private String component;
    private Map<String, String> meta;
    private Integer hidden;
    private String external;
    private List<MenuVO> children = new ArrayList<>();
}

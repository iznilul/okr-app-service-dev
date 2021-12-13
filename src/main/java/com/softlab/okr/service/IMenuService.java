package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Menu;
import com.softlab.okr.model.vo.MenuVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
public interface IMenuService extends IService<Menu> {

  List<MenuVO> getMenu();
}

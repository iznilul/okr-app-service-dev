package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Menu;
import com.itlab.blog.model.vo.MenuVO;

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

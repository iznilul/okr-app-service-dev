package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Route;
import com.softlab.okr.model.vo.RouteVO;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
public interface IRouteService extends IService<Route> {

  List<RouteVO> getRoutes();
}

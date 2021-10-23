package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Route;
import com.softlab.okr.mapper.RouteMapper;
import com.softlab.okr.model.vo.RouteVO;
import com.softlab.okr.service.IRouteService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
@Service
public class RouteServiceImpl extends ServiceImpl<RouteMapper, Route> implements IRouteService {

  @Autowired
  private RouteMapper routeMapper;

  @Override
  public List<RouteVO> getRoutes() {
    List<Route> routeList = routeMapper.selectList(null);
    List<RouteVO> fatherRouteList = getFatherRoute(routeList);
    return getChildren(routeList, fatherRouteList);
  }

  public List<RouteVO> getFatherRoute(List<Route> list) {
    List<RouteVO> voList = new LinkedList<>();
    for (Route route : list) {
      // 这个exists方法就是判断是不是父路径
      if (!exists(list, route.getParentId())) {
        RouteVO vo = routeToVO(route);
        voList.add(vo);
      }
    }
    return voList;
  }

  public List<RouteVO> getChildren(List<Route> routeList, List<RouteVO> fatherRouteList) {
    LinkedList<RouteVO> voList = new LinkedList<>();
    List<RouteVO> list = new ArrayList<>();
    if (fatherRouteList.get(0) != null) {
      voList.add(fatherRouteList.get(0));
    }
    while (voList.size() > 0) {
      RouteVO node = voList.pop();
      routeList.forEach(route -> {
        if (route.getParentId().equals(node.getRouteId())) {
          RouteVO child = routeToVO(route);
          if (null != node.getChildren()) {
            node.addChildren(child);
          } else {
            List<RouteVO> l = new ArrayList<>();
            l.add(child);
            node.setChildren(l);
          }
          voList.add(child);
        }
      });
      list.add(node);
    }
    return list;
  }

  private RouteVO routeToVO(Route route) {
    RouteVO vo = new RouteVO();
    BeanUtils.copyProperties(route, vo);
    Map<String, String> meta = new HashMap<>();
    meta.put("type", route.getType());
    meta.put("text", route.getText());
    meta.put("size", route.getSize());
    vo.setMeta(meta);
    return vo;
  }

  /**
   * 判断子集
   *
   * @param list
   * @param parentId
   * @return
   */
  private boolean exists(List<Route> list, Integer parentId) {
    for (Route route : list) {
      if (route.getRouteId().equals(parentId)) {
        return true;
      }
    }
    return false;
  }

}

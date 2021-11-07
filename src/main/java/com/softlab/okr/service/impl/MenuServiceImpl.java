package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Menu;
import com.softlab.okr.mapper.MenuMapper;
import com.softlab.okr.model.vo.MenuVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IMenuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-10-24
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private IAuthenticationService authenticationService;

    @Override
    public List<MenuVO> getMenu() {
        int userId = authenticationService.getUserId();
        List<Menu> menuList = menuMapper.selectMenuByUserId(userId);
        List<Menu> fatherList = new ArrayList<>();
        menuList.forEach(menu -> {
            if (menu.getParentId().equals(0)) {
                fatherList.add(menu);
            }
        });
        return getChildren(fatherList, menuList);

    }

    public List<MenuVO> getChildren(List<Menu> fatherList, List<Menu> menuList) {
        List<MenuVO> list = new ArrayList<>();
        fatherList.forEach(fatherMenu -> {
            MenuVO vo = menuToVO(fatherMenu);
            for (Menu menu : menuList) {
                if (menu.getParentId().equals(fatherMenu.getMenuId())) {
                    menu.setPath(vo.getPath() + menu.getPath());
                    vo.getChildren().add(menuToVO(menu));
                }
            }
            list.add(vo);
        });
        return list;
    }

    private MenuVO menuToVO(Menu menu) {
        MenuVO vo = new MenuVO();
        BeanUtils.copyProperties(menu, vo);
        Map<String, String> meta = new HashMap<>();
        meta.put("type", menu.getType());
        meta.put("text", menu.getText());
        meta.put("size", menu.getSize());
        vo.setMeta(meta);
        return vo;
    }
}

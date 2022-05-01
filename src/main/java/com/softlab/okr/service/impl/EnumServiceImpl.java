package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.Category;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-10-05 21:40
 **/
@Service
public class EnumServiceImpl implements IEnumService {

    @Autowired
    private IUserEntityService userEntityService;

    @Autowired
    private IUserInfoService userInfoService;

    @Autowired
    private ITagService tagService;

    @Autowired
    private ICategoryService categoryService;

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<String> getLikeUsername(String username) {
        return userEntityService
                .list(new QueryWrapper<UserEntity>().like("username", username)).stream()
                .map(UserEntity::getUsername).collect(Collectors.toList());
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<String> getLikeName(String name) {
        return userInfoService
                .list(new QueryWrapper<UserInfo>().like("name", name)).stream()
                .map(UserInfo::getName).collect(Collectors.toList());
    }

    @Override
    @Cacheable(cacheNames = EntityNames.USER_INFO + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<String> getLikeMajor(String major) {
        return userInfoService
                .list(new QueryWrapper<UserInfo>().like("major", major)).stream()
                .map(UserInfo::getMajor).collect(Collectors.toList());
    }

    @Override
    @Cacheable(cacheNames = EntityNames.TAG + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<String> getLikeTag() {
        return tagService
                .list((new QueryWrapper<Tag>().orderByDesc("weight"))).stream()
                .map(Tag::getName).collect(Collectors.toList());
    }

    @Override
    @Cacheable(cacheNames = EntityNames.CATEGORY + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public List<String> getLikeCategory() {
        return categoryService
                .list((new LambdaQueryWrapper<Category>().orderByDesc(Category::getWeight))).stream()
                .map(Category::getName).collect(Collectors.toList());
    }
}

package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.entity.UserEntity;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.service.IEnumService;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.service.IUserEntityService;
import com.softlab.okr.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Override
    public List<String> getLikeUsername(String username) {
        return userEntityService
                .list(new QueryWrapper<UserEntity>().like("username", username)).stream()
                .map(UserEntity::getUsername).collect(Collectors.toList());
    }

    @Override
    public List<String> getLikeName(String name) {
        return userInfoService
                .list(new QueryWrapper<UserInfo>().like("name", name)).stream()
                .map(UserInfo::getName).collect(Collectors.toList());
    }

    @Override
    public List<String> getLikeMajor(String major) {
        return userInfoService
                .list(new QueryWrapper<UserInfo>().like("major", major)).stream()
                .map(UserInfo::getMajor).collect(Collectors.toList());
    }

    @Override
    public List<String> getLikeTag(String name) {
        return tagService
                .list((new QueryWrapper<Tag>().like("name", name).orderByDesc("order"))).stream()
                .map(Tag::getName).collect(Collectors.toList());
    }
}

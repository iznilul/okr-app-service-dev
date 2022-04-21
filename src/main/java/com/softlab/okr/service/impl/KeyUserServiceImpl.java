package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyUserMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.KeyUserEnum;
import com.softlab.okr.model.vo.KeyUserVO;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-27
 */
@Service
public class KeyUserServiceImpl extends ServiceImpl<KeyUserMapper, KeyUser> implements
        IKeyUserService {

    @Autowired
    private KeyUserMapper keyUserMapper;

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY_USER, allEntries = true)
    public void saveKeyUser(int keyId, int userId) {
        KeyUser keyUser = new KeyUser(null, keyId, userId, KeyUserEnum.NORMAL.code(), null);
        keyUserMapper.insert(keyUser);
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY_USER, allEntries = true)
    public void modifyKeyUser(int keyId, int userId, int status) {
        KeyUser keyUser = this.getOne(new QueryWrapper<KeyUser>().eq("key_id", keyId).eq("user_id"
                , userId)
                .orderByDesc("id").last("limit 1"));
        keyUser.setStatus(status);
        keyUserMapper.updateById(keyUser);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.KEY_USER + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Result getKeyUser(PageDTO dto) {
        Page<KeyUser> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<KeyUserVO> voPage = keyUserMapper.selectKeyUserVO(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(KeyUserEnum.getMessage(vo.getStatus()));
        });
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY_USER, allEntries = true)
    public void removeByUserId(int id) {
        keyUserMapper.deleteById(id);
    }
}

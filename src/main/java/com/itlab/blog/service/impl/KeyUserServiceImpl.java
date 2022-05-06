package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.entity.KeyUser;
import com.itlab.blog.mapper.KeyUserMapper;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.enums.KeyUserEnum;
import com.itlab.blog.model.vo.KeyUserVO;
import com.itlab.blog.service.IKeyUserService;
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
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<KeyUserVO> getKeyUser(PageDTO dto) {
        Page<KeyUser> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<KeyUserVO> voPage = keyUserMapper.selectKeyUserVO(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(KeyUserEnum.getMessage(vo.getStatus()));
        });
        return voPage;
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY_USER, allEntries = true)
    public void removeByUserId(int id) {
        keyUserMapper.deleteById(id);
    }
}

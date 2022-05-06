package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.entity.Key;
import com.itlab.blog.entity.KeyUser;
import com.itlab.blog.mapper.KeyMapper;
import com.itlab.blog.model.dto.KeyDTO;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.enums.KeyEnum;
import com.itlab.blog.model.enums.KeyUserEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.model.vo.KeyVO;
import com.itlab.blog.security.IAuthenticationService;
import com.itlab.blog.service.IKeyService;
import com.itlab.blog.service.IKeyUserService;
import com.itlab.blog.utils.CopyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class KeyServiceImpl extends ServiceImpl<KeyMapper, Key> implements IKeyService {

    @Autowired
    private KeyMapper keyMapper;

    @Autowired
    private IKeyUserService keyUserService;

    @Autowired
    private IAuthenticationService authenticationService;

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY, allEntries = true)
    public void saveKey(String keyName) {
        if (null != keyMapper.selectOne(new QueryWrapper<Key>().eq("key_name", keyName))) {
            throw new BusinessException("添加钥匙失败");
        }
        Key key = new Key(null, keyName, 0);
        keyMapper.insert(key);
    }

    @Override
    @CacheEvict(cacheNames = EntityNames.KEY, allEntries = true)
    public void modifyKey(KeyDTO dto) {
        Key key = CopyUtil.copy(dto, Key.class);
        key.setStatus(KeyEnum.getCode(dto.getStatusName()));
        keyMapper.updateById(key);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {EntityNames.KEY, EntityNames.KEY_USER}, allEntries = true)
    public void removeById(int keyId) {
        keyUserService.remove(new QueryWrapper<KeyUser>().eq("key_id", keyId));
        keyMapper.deleteById(keyId);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.KEY + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<KeyVO> getKey(PageDTO dto) {
        Page<Key> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<KeyVO> voPage = keyMapper.selectKeyList(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(KeyEnum.getMessage(vo.getStatus()));
        });
        return voPage;
    }

    @Override
    @Cacheable(cacheNames = EntityNames.KEY + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public KeyVO getKeyById(int keyId) {
        Key key = keyMapper.selectById(keyId);
        KeyVO vo = CopyUtil.copy(key, KeyVO.class);
        vo.setStatusName(KeyEnum.getMessage(key.getStatus()));
        return vo;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = EntityNames.KEY, allEntries = true)
    public void borrowKey(int keyId) {
        Key key = keyMapper.selectOne(new QueryWrapper<Key>().eq("key_id", keyId));
        if (key.getStatus() == 1) {
            throw new BusinessException("钥匙已经借出");
        }
        key.setStatus(KeyEnum.BORROWED.code());
        keyMapper.updateById(key);
        Integer userId = authenticationService.getUserId();
        keyUserService.saveKeyUser(keyId, userId);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = EntityNames.KEY, allEntries = true)
    public void returnKey(int keyId) {
        Key key = keyMapper.selectOne(new QueryWrapper<Key>().eq("key_id", keyId));
        if (key.getStatus() == 0) {
            throw new BusinessException("钥匙并未借出，无法归还");
        }

        key.setStatus(KeyEnum.NORMAL.code());
        keyMapper.updateById(key);

        Integer userId = authenticationService.getUserId();
        keyUserService.modifyKeyUser(keyId, userId, KeyUserEnum.BORROWED.code());
    }
}

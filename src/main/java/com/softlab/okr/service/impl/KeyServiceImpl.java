package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.Key;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyMapper;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.KeyEnum;
import com.softlab.okr.model.enums.KeyUserEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.CopyUtil;
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
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
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
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
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

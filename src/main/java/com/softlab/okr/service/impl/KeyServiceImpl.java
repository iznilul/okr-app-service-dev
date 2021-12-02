package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Key;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyMapper;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.KeyEnum;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.security.IAuthenticationService;
import com.softlab.okr.service.IKeyService;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.CopyUtil;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
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
    public int saveKey(String keyName) {
        if (null != keyMapper.selectOne(new QueryWrapper<Key>().eq("key_name", keyName))) {
            return 0;
        } else {
            Key key = new Key(null, keyName, 0);
            return keyMapper.insert(key);
        }
    }

    @Override
    public int modifyKey(KeyDTO dto) {
        Key key = CopyUtil.copy(dto, Key.class);
        key.setStatus(KeyEnum.getCode(dto.getStatusName()));
        return keyMapper.updateById(key);
    }

    @Override
    @Transactional
    public int removeById(int keyId) {
        keyUserService.remove(new QueryWrapper<KeyUser>().eq("key_id", keyId));
        return keyMapper.deleteById(keyId);
    }

    @Override
    public Result getKey(PageDTO dto) {
        Page<Key> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<KeyVO> voPage = keyMapper.selectKeyList(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(KeyEnum.getMessage(vo.getStatus()));
        });
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @Override
    public KeyVO getKeyById(int keyId) {
        Key key = keyMapper.selectById(keyId);
        KeyVO vo = CopyUtil.copy(key, KeyVO.class);
        vo.setStatusName(KeyEnum.getMessage(key.getStatus()));
        return vo;
    }

    @Override
    @Transactional
    public int borrowKey(int keyId) {
        if (keyMapper.selectById(keyId).getStatus() == 1) {
            return 0;
        } else {
            if (keyMapper.update(null, new UpdateWrapper<Key>().eq("key_id", keyId).set("status", 1))
                    == 0) {
                return 0;
            } else {
                Integer userId = authenticationService.getUserId();
                return keyUserService.saveKeyUser(keyId, userId);
            }
        }
    }

    @Override
    @Transactional
    public int returnKey(int keyId) {
        if (keyMapper.selectById(keyId).getStatus() == 0) {
            return 0;
        } else {
            if (keyMapper.update(null, new UpdateWrapper<Key>().eq("key_id", keyId).set("status", 0))
                    == 0) {
                return 0;
            } else {
                Integer userId = authenticationService.getUserId();
                return keyUserService.modifyKeyUser(keyId, userId, 1);
            }
        }
    }
}

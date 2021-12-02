package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.KeyUser;
import com.softlab.okr.mapper.KeyUserMapper;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.enums.KeyUserEnum;
import com.softlab.okr.model.vo.KeyUserVO;
import com.softlab.okr.service.IKeyUserService;
import com.softlab.okr.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
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
    public int saveKeyUser(int keyId, int userId) {
        KeyUser keyUser = new KeyUser(null, keyId, userId, 0, null);
        return keyUserMapper.insert(keyUser);
    }

    @Override
    public int modifyKeyUser(int keyId, int userId, int status) {
        return keyUserMapper
                .update(null, new UpdateWrapper<KeyUser>().eq("key_id", keyId).eq("user_id", userId)
                        .set("status", status).orderByDesc("id").last("limit 1"));
    }

    @Override
    public Result getKeyUser(PageDTO dto) {
        Page<KeyUser> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<KeyUserVO> voPage = keyUserMapper.selectKeyUserVO(page);
        voPage.getRecords().forEach(vo -> {
            vo.setStatusName(KeyUserEnum.getMessage(vo.getStatus()));
        });
        return Result.success(voPage.getRecords(), voPage.getCurrent(), voPage.getTotal());
    }

    @Override
    public int removeByUserId(int id) {
        return keyUserMapper.deleteById(id);
    }
}

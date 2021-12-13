package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Key;
import com.softlab.okr.model.dto.KeyDTO;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.model.vo.KeyVO;
import com.softlab.okr.utils.Result;

public interface IKeyService extends IService<Key> {

    int saveKey(String keyName);

    int modifyKey(KeyDTO dto);

    int removeById(int keyId);

    Result getKey(PageDTO dto);

    KeyVO getKeyById(int keyId);

    int borrowKey(int keyId);

    int returnKey(int keyId);
}

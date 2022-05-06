package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Key;
import com.itlab.blog.model.dto.KeyDTO;
import com.itlab.blog.model.dto.PageDTO;
import com.itlab.blog.model.vo.KeyVO;

public interface IKeyService extends IService<Key> {

    void saveKey(String keyName);

    void modifyKey(KeyDTO dto);

    void removeById(int keyId);

    Page<KeyVO> getKey(PageDTO dto);

    KeyVO getKeyById(int keyId);

    void borrowKey(int keyId);

    void returnKey(int keyId);
}

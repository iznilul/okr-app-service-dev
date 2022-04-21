package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.TagAddDTO;
import com.softlab.okr.model.dto.TagChangeDTO;
import com.softlab.okr.model.dto.TagDTO;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface ITagService extends IService<Tag> {

    Page<Tag> getTagList(TagDTO dto);

    void saveTag(TagAddDTO dto);

    Tag getTag(Integer id);

    void modifyTag(TagChangeDTO dto);

    void removeById(Integer tagId);
}

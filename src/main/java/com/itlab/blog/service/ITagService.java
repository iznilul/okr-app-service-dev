package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Tag;
import com.itlab.blog.model.dto.TagAddDTO;
import com.itlab.blog.model.dto.TagChangeDTO;
import com.itlab.blog.model.dto.TagDTO;

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
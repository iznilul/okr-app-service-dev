package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.utils.Result;

import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface ITagService extends IService<Tag> {

    Result getTagListByCond(TagDTO dto);

    int saveTag(String name, int order);

    Tag getTag(String name);

    int modifyTag(Integer tagId, String name, Integer order);

    int removeById(int tagId);

    List<Tag> getTagList();

    List<Integer> getTagIdList();
}

package com.softlab.okr.service;

import com.github.pagehelper.PageInfo;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.dto.TagDTO;
import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:15
 * @Version 1.0
 */
public interface TagService {


  int saveTag(String name, int order) throws ServiceException;

  Tag getTagByName(String name) throws ServiceException;

  int modifyTag(Tag tag) throws ServiceException;

  int removeById(int tagId) throws ServiceException;

  PageInfo<Tag> getTagListByCond(TagDTO dto) throws ServiceException;

  List<Tag> getTagList() throws ServiceException;

  List<Integer> getTagIdList() throws ServiceException;

}

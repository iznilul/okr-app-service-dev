package com.softlab.okr.service.ServiceImpl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.mapper.TagMapper;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.model.entity.Tag;
import com.softlab.okr.service.TagService;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
public class TagServiceImpl implements TagService {

  @Autowired
  private TagMapper tagMapper;

  @Autowired
  private BookMapper bookMapper;

  @Override
  public int saveTag(String name, int order) {
    return tagMapper.insertTag(name, order);
  }

  @Override
  public Tag getTagByName(String name) {
    return tagMapper.selectByName(name);
  }

  @Override
  public PageInfo<Tag> getTagListByCond(TagDTO dto) {
    PageHelper.startPage(dto.getIndex(), dto.getPageSize());
    List<Tag> list = tagMapper.selectTagListByCond(dto);
    return new PageInfo<>(list);
  }

  @Override
  public int modifyTag(Tag tag) {
    return tagMapper.updateTag(tag);
  }

  @Override
  public int removeById(int tagId) {
    bookMapper.deleteBookTagByTagId(tagId);
    return tagMapper.deleteById(tagId);
  }

  @Override
  public List<Tag> getTagList() {
    return tagMapper.selectList();
  }

  @Override
  public List<Integer> getTagIdList() {
    List<Tag> tagList = this.getTagList();
    List<Integer> list = new LinkedList<>();
    tagList.forEach(tag -> {
      list.add(tag.getTagId());
    });
    return list;
  }
}

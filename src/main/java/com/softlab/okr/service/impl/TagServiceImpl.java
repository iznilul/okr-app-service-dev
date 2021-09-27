package com.softlab.okr.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.mapper.TagMapper;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.ITagService;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements ITagService {

  @Autowired
  private TagMapper tagMapper;

  @Override
  public int saveTag(String name, int order) {
    Tag tag = new Tag(null, name, order);
    return tagMapper.insert(tag);
  }

  @Override
  public Tag getTag(String name) {
    return tagMapper.selectOne(new QueryWrapper<Tag>().eq("name", name));
  }

  @Override
  public Page<Tag> getTagListByCond(TagDTO dto) {
    Page<Tag> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<Tag> tagPage = tagMapper.selectPage(page, new QueryWrapper<Tag>()
        .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
        .orderBy(dto.getOrderRule().equals("ASC"), true, "order"));
    return page;
  }

  @Override
  public int modifyTag(Integer tagId, String name, Integer order) {
    Tag tag = new Tag(tagId, name, order);
    return tagMapper.updateById(tag);
  }

  @Override
  public int removeById(int tagId) {
    return tagMapper.deleteById(tagId);
  }

  @Override
  public List<Tag> getTagList() {
    return tagMapper.selectList(null);
  }

  @Override
  public List<Integer> getTagIdList() {
    List<Tag> tagList = this.getTagList();
    return tagList.stream().map(Tag::getTagId).collect(Collectors.toList());
  }
}

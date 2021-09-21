package com.softlab.okr.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Tag;
import com.softlab.okr.mapper.TagMapper;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.service.ITagService;
import com.softlab.okr.utils.Result;
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
  public Result saveTag(String name, int order) {
    if (null != tagMapper.selectOne(new QueryWrapper<Tag>().eq("name", name))) {
      return Result.failure();
    } else {
      Tag tag = new Tag(null, name, order);
      int flag = tagMapper.insert(tag);
      return flag == 1 ? Result.success() : Result.failure();
    }
  }

  @Override
  public Result getTag(String name) {
    Tag tag = tagMapper.selectOne(new QueryWrapper<Tag>().eq("name", name));
    return tag == null ? Result.success() : Result.failure();
  }

  @Override
  public Result getTagListByCond(TagDTO dto) {
    Page<Tag> page = new Page<>();
    Page<Tag> tagPage = tagMapper.selectTagListByCond(page, dto);
    List<Tag> list = tagPage.getRecords();
    return Result.success(list);
  }

  @Override
  public Result modifyTag(Integer tagId, String name, Integer order) {
    Tag tag = new Tag(tagId, name, order);
    int flag = tagMapper.updateById(tag);
    return flag == 1 ? Result.success() : Result.failure();
  }

  @Override
  public Result removeById(int tagId) {
    int flag = tagMapper.deleteById(tagId);
    return flag == 1 ? Result.success() : Result.failure();
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

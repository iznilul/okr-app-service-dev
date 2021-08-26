package com.softlab.okr.service.ServiceImpl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.TagMapper;
import com.softlab.okr.model.dto.TagDTO;
import com.softlab.okr.model.entity.Tag;
import com.softlab.okr.service.TagService;
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

  @Override
  public int saveTag(String name, int order) {
    return tagMapper.insertTag(name, order);
  }

  @Override
  public Tag getTagByName(String name) {
    return tagMapper.selectByName(name);
  }

  @Override
  public PageInfo<Tag> getTagListByCond(TagDTO tagDTO) {
    PageHelper.startPage(tagDTO.getIndex(), tagDTO.getPageSize());
    List<Tag> list = tagMapper.selectTagListByCond(tagDTO);
    return new PageInfo<>(list);
  }

  @Override
  public int modifyTag(Tag tag) {
    return tagMapper.updateTag(tag);
  }
  
  @Override
  public int removeByIdList(List<Integer> list) {
    return tagMapper.deleteByIdList(list);
  }

  @Override
  public List<Tag> getTagList() {
    return tagMapper.selectList();
  }
}

package com.softlab.okr.mapper;

import com.softlab.okr.entity.Tag;
import com.softlab.okr.model.dto.TagDTO;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface TagMapper {

  int insertTag(String name, int order) throws DataAccessException;

  int updateTag(Tag tag) throws DataAccessException;

  int deleteById(int tagId) throws DataAccessException;

  List<Tag> selectList() throws DataAccessException;

  Tag selectByName(String name) throws DataAccessException;

  List<Tag> selectTagListByCond(TagDTO dto) throws DataAccessException;
}

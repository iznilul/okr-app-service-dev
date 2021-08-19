package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.Tag;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagMapper {

    int insertTag(Tag tag) throws DataAccessException;

    int deleteById(int tagId) throws DataAccessException;

    int updateById(Tag tag) throws DataAccessException;

    List<Tag> selectList() throws DataAccessException;
}

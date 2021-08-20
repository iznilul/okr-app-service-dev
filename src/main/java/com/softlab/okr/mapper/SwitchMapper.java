package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.Switch;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface SwitchMapper {

  List<Switch> selectList() throws DataAccessException;

  int updateStatus(String name) throws DataAccessException;

  Byte selectStatus(String name) throws DataAccessException;

  int deleteByName(String name) throws DataAccessException;

  int insertSwitch(String name) throws DataAccessException;

}

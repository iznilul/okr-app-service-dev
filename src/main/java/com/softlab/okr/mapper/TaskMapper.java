package com.softlab.okr.mapper;

import com.softlab.okr.entity.Task;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskMapper {

  Task selectByTaskId(String TaskId) throws DataAccessException;

  List<Task> selectList() throws DataAccessException;

  int insertAll(List<Task> list) throws DataAccessException;

  int deleteAll() throws DataAccessException;

}

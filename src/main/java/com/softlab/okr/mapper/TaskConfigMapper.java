package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.TaskConfig;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskConfigMapper {

  TaskConfig selectByTaskId(String taskId) throws DataAccessException;

  List<TaskConfig> selectList() throws DataAccessException;

  List<TaskConfig> selectByStatus(int status) throws DataAccessException;

  TaskConfig selectByTaskIdAndStatus(String taskId, int status) throws DataAccessException;

  int updateTaskConfig(TaskConfig taskConfig) throws DataAccessException;

  int deleteById(String taskId) throws DataAccessException;

  int insertTaskConfig(TaskConfig taskConfig) throws DataAccessException;

}

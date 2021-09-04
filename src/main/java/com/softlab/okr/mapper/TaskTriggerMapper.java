package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.TaskTrigger;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskTriggerMapper {

  TaskTrigger selectByTaskId(String taskId) throws DataAccessException;

  List<TaskTrigger> selectList() throws DataAccessException;

  List<TaskTrigger> selectByStatus(int status) throws DataAccessException;

  TaskTrigger selectByTaskIdAndStatus(String taskId, int status) throws DataAccessException;

  int updateTaskTrigger(TaskTrigger taskTrigger) throws DataAccessException;

  int deleteById(String taskId) throws DataAccessException;

  int insertTaskTrigger(TaskTrigger taskTrigger) throws DataAccessException;

}

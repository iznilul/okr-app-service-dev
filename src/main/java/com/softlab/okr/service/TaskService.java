package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;
import com.softlab.okr.model.entity.Task;
import java.util.List;

public interface TaskService {

  Task getByTaskId(String taskId) throws ServiceException;

  List<Task> list() throws ServiceException;

  int saveAll(List<Task> list) throws ServiceException;

  int removeAll() throws ServiceException;

}

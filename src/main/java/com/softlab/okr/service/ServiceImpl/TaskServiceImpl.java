package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.dao.TaskMapper;
import com.softlab.okr.model.entity.Task;
import com.softlab.okr.service.TaskService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-02 10:40
 **/
@Service
public class TaskServiceImpl implements TaskService {

  @Autowired
  private TaskMapper taskMapper;

  @Override
  public Task getByTaskId(String taskid) {
    return new Task();
  }

  @Override
  public List<Task> list() {
    return taskMapper.selectList();
  }

  @Override
  public int saveAll(List<Task> list) {
    return taskMapper.insertAll(list);
  }

  @Override
  public int removeAll() {
    return taskMapper.deleteAll();
  }
}

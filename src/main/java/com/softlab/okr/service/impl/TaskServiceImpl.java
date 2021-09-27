package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Task;
import com.softlab.okr.mapper.TaskMapper;
import com.softlab.okr.service.ITaskService;
import org.springframework.stereotype.Service;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-02 10:40
 **/
@Service
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task> implements ITaskService {

}

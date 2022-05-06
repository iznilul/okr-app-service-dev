package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.entity.Task;
import com.itlab.blog.mapper.TaskMapper;
import com.itlab.blog.service.ITaskService;
import org.springframework.stereotype.Service;

/**
 * @Program: blog
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-02 10:40
 **/
@Service
public class TaskServiceImpl extends ServiceImpl<TaskMapper, Task> implements ITaskService {

}

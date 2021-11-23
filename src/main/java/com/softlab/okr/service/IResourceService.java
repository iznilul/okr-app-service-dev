package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.model.dto.PageDTO;
import com.softlab.okr.utils.Result;

import java.util.Set;

public interface IResourceService extends IService<Resource> {

    Result getResourceList(PageDTO dto);

    int modifyResourceStatus(int id);

    Set<Integer> getResourceByUserId(int userId);
}

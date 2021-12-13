package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.utils.Result;

import java.util.List;
import java.util.Set;

public interface IResourceService extends IService<Resource> {

    Result getResourceList(ResourceDTO dto);

    int modifyResourceStatus(String id);

    Set<String> getResourceByUserId(int userId);

    List<String> getResourceName(String name);
}

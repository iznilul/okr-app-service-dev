package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.model.dto.ResourceDTO;

import java.util.List;
import java.util.Set;

public interface IResourceService extends IService<Resource> {

    Page<Resource> getResourceList(ResourceDTO dto);

    void modifyResourceStatus(String id);

    Set<String> getResourceByUserId(int userId);

    List<String> getResourceName(String name);
}

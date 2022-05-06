package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.Resource;
import com.itlab.blog.model.dto.ResourceDTO;
import com.itlab.blog.model.vo.ResourceVO;

import java.util.Set;

public interface IResourceService extends IService<Resource> {

    Page<ResourceVO> getResourceList(ResourceDTO dto);

    void modifyResourceStatus(String id);

    Set<String> getResourceByUserId(int userId);
}

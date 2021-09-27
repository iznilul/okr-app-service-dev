package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.model.enums.statusCode.ResourceStatus;
import com.softlab.okr.model.vo.ResourceVO;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.security.MySecurityMetadataSource;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.utils.Result;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements
    IResourceService {

  @Autowired
  private ResourceMapper resourceMapper;

  @Override
  public Result getResourceList(ResourceDTO dto) {
    Page<Resource> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<Resource> resourcePage = resourceMapper.selectPage(page, null);
    List<ResourceVO> list = new ArrayList<>();
    resourcePage.getRecords().forEach(resource -> {
      ResourceVO vo = new ResourceVO();
      BeanUtils.copyProperties(resource, vo);
      vo.setStatusName(ResourceStatus.getMessage(resource.getStatus()));
      list.add(vo);
    });
    return Result.success(list, resourcePage.getTotal());
  }

  @Override
  public List<Integer> getResourceIds(String role) {
    Set<Resource> resources = MySecurityMetadataSource.getRESOURCES();
    List<Integer> list = new LinkedList<>();
    if (role.equals("admin")) {
      resources = this.filterResource(resources);
      resources.forEach(
          resource -> {
            list.add(resource.getResourceId());
          });
      return list;
    }
    resources.forEach(
        resource -> {
          String[] split = resource.getPath().split("/");
          if (split[2].equals(role)) {
            list.add(resource.getResourceId());
          }
        });
    return list;
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public int reloadRoleResource(RoleResourceBo bo) {
    resourceMapper.deleteRoleResource(bo.getRoleId());
    return this.saveRoleResource(bo);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public int modifyResourceStatus(int resourceId) {
    ApiFilter.updateResources(resourceId);
    return resourceMapper.updateResourceStatus(resourceId);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class)
  public void appStartLoad(List<Resource> list) {
    this.removeList();
    this.saveResources(list);
    this.reloadRoleResource(new RoleResourceBo(1, this.getResourceIds("admin")));
    this.reloadRoleResource(new RoleResourceBo(2, this.getResourceIds("user")));
  }

  @Override
  public Set<Resource> filterResource(Collection<Resource> list) {
    Set<Resource> set = new HashSet<>();
    list.forEach(
        resource -> {
          String role = resource.getPath().split("/")[2];
          if (!role.equals("common")) {
            set.add(resource);
          }
        });
    return set;
  }
}

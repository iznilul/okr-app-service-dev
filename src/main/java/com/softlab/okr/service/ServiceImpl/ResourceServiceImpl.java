package com.softlab.okr.service.ServiceImpl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.dto.ResourceDTO;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.model.enums.statusCode.ResourceStatus;
import com.softlab.okr.model.vo.ResourceVO;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.security.MySecurityMetadataSource;
import com.softlab.okr.service.ResourceService;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResourceServiceImpl implements ResourceService {

  @Autowired
  ResourceMapper resourceMapper;

  @Override
  public int saveResources(List<Resource> resourceList) {
    return resourceMapper.insertResource(resourceList);
  }

  @Override
  public int saveRoleResource(RoleResourceBo bo) {
    return resourceMapper.insertRoleResource(bo);
  }

  @Override
  public int removeList() {
    return resourceMapper.deleteList();
  }

  @Override
  public PageInfo<ResourceVO> getResourceList(ResourceDTO dto) {
    PageHelper.startPage(dto.getIndex(), dto.getPageSize());
    List<ResourceVO> list = resourceMapper.selectResourceList();
    list.forEach(vo -> {
      vo.setStatusName(ResourceStatus.getMessage(vo.getStatus()));
    });
    return new PageInfo<>(list);
  }

  @Override
  public Resource getResourceByPath(String path) {
    return resourceMapper.selectResourceByPath(path);
  }

  @Override
  public Resource getResourceById(int resourceId) {
    return resourceMapper.selectResourceById(resourceId);
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
      rollbackFor = Exception.class,
      readOnly = false)
  public int reloadRoleResource(RoleResourceBo bo) {
    resourceMapper.deleteRoleResource(bo.getRoleId());
    return this.saveRoleResource(bo);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
  public int modifyResourceStatus(int resourceId) {
    ApiFilter.updateResources(resourceId);
    return resourceMapper.updateResourceStatus(resourceId);
  }

  @Override
  @Transactional(
      propagation = Propagation.REQUIRED,
      isolation = Isolation.READ_COMMITTED,
      rollbackFor = Exception.class,
      readOnly = false)
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

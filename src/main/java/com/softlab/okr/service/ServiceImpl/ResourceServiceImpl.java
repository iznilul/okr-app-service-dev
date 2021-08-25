package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    ResourceMapper resourceMapper;

    @Autowired
    RedisTemplate redisTemplate;

    @Override
    public int saveResources(List<Resource> resourceList) {
        return resourceMapper.insertResource(resourceList);
    }

    @Override
    public int saveRoleResource(RoleResourceBo roleResourceBo) {
        return resourceMapper.insertRoleResource(roleResourceBo);
    }

    @Override
    public int removeList() {
        return resourceMapper.deleteList();
    }

    @Override
    public Resource getResourceByPath(String path) {
        return resourceMapper.selectResourceByPath(path);
    }

    @Override
    public List<Integer> getResourceIds(String role) {
        Set<Resource> resources = redisTemplate.opsForSet().members("resource");
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
    public int reloadRoleResource(RoleResourceBo roleResourceBo) {
        resourceMapper.deleteRoleResource(roleResourceBo.getRoleId());
        return this.saveRoleResource(roleResourceBo);
    }

    @Override
    public int modifyResourceStatus(int resourceId) {
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
                    if (role.equals("user") || role.equals("admin")) {
                        set.add(resource);
                    }
                });
        return set;
    }
}

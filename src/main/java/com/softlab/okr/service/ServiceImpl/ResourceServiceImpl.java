package com.softlab.okr.service.ServiceImpl;

import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.security.MySecurityMetadataSource;
import com.softlab.okr.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class ResourceServiceImpl implements ResourceService {
    @Autowired
    ResourceMapper resourceMapper;

    @Override
    public void saveResources(List<Resource> resourceList) {
        resourceMapper.insertResource(resourceList);
    }

    @Override
    public void saveRoleResource(RoleResourceBo roleResourceBo) {
        resourceMapper.insertRoleResource(roleResourceBo);
    }

    @Override
    public void removeList() {
        resourceMapper.deleteList();
    }

    @Override
    public Resource getResourceByPath(String path) {
        return resourceMapper.selectResourceByPath(path);
    }

    @Override
    public List<Integer> getResourceIds(String role) {
        Set<Resource> resources = MySecurityMetadataSource.getRESOURCES();
        List<Integer> list = new ArrayList<>();

        if (role.equals("admin")) {
            for (Resource resource : resources) {
                list.add(resource.getResourceId());
            }
            return list;
        }

        for (Resource resource : resources) {
            String[] split = resource.getPath().split("/");
            if (split[2].equals(role)) {
                list.add(resource.getResourceId());
            }
        }
        return list;
    }

    @Override
    public void reloadRoleResource(RoleResourceBo roleResourceBo) {
        resourceMapper.deleteRoleResource(roleResourceBo.getRoleId());
        this.saveRoleResource(roleResourceBo);
    }

    @Override
    public int modifyResourceStatus(int resourceId) {
        return resourceMapper.updateResourceStatus(resourceId);
    }
}

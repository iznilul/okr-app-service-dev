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
    public void addResources(List<Resource> resourceList) {
        resourceMapper.insertResources(resourceList);
    }

    @Override
    public void addRoleResource(RoleResourceBo roleResourceBo) {
        resourceMapper.insertRoleResource(roleResourceBo);
    }

    @Override
    public void removeByType(int type) {
        resourceMapper.deleteByType(type);
    }

    @Override
    public List<Integer> getResourceIds(String role) {
        Set<Resource> resources = MySecurityMetadataSource.getRESOURCES();
        List<Integer> list = new ArrayList<>();

        if (role.equals("admin")) {
            for (Resource resource : resources) {
                String[] split = resource.getPath().split("/");
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
        this.addRoleResource(roleResourceBo);
    }
}

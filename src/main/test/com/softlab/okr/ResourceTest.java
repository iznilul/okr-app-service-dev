package com.softlab.okr;

import com.softlab.okr.mapper.ResourceMapper;
import com.softlab.okr.model.bo.RoleResourceBo;
import com.softlab.okr.model.entity.Resource;
import com.softlab.okr.security.MySecurityMetadataSource;
import com.softlab.okr.service.ResourceService;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 21:44
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class ResourceTest {
    @Autowired
    ResourceMapper resourceMapper;

    @Autowired
    ResourceService resourceService;

    @BeforeClass    //公开表态无返回值
    public static void beforeClass() throws Exception {
        //每次测试类执行前执行一次，主要用来初使化公共资源等
    }

    @AfterClass     //公开表态无返回值
    public static void afterClass() throws Exception {
        //每次测试类执行完成后执行一次，主要用来释放资源或清理工作
    }

    @Before
    public void setup() throws Exception {
        //每个测试案例执行前都会执行一次
    }

    @After
    public void teardown() throws Exception {
        //每个测试案例执行完成后都会执行一次
    }

    @Test
    public void resourceTest() {
//        Set<Integer> resourceIds = resourceMapper.getByUserId(1);
//        System.out.println(resourceIds);
        Set<Resource> set = MySecurityMetadataSource.getRESOURCES();
        System.out.println(set);
    }

    @Test
    public void getResourceIds() {
        Set<Resource> resources = MySecurityMetadataSource.getRESOURCES();
        for (Resource resource : resources) {
            String[] split = resource.getPath().split("/");
            if (split[2].equals("user")) {
                System.out.println(resource.getResourceId());
            }
        }
    }

    @Test
    public void insertRoleResource() {
        RoleResourceBo roleResourceBo = new RoleResourceBo(1, resourceService.getResourceIds(
                "admin"));
        resourceService.addRoleResource(roleResourceBo);
    }

    @Test
    public void selectByUserId() {
        Set<Integer> resourceIds = resourceMapper.selectByUserId(1);
        for (int i : resourceIds) {
            System.out.println(i);
        }
    }

    @Test
    public void reloadAdminRoleResource() {
        RoleResourceBo roleResourceBo = new RoleResourceBo(1, resourceService.getResourceIds(
                "admin"));
        resourceService.reloadRoleResource(roleResourceBo);
    }

    @Test
    public void reloadUserRoleResource() {
        RoleResourceBo roleResourceBo = new RoleResourceBo(2, resourceService.getResourceIds(
                "user"));
        resourceService.reloadRoleResource(roleResourceBo);
    }
}


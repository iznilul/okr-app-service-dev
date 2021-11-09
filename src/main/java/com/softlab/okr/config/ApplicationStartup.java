package com.softlab.okr.config;

import com.softlab.okr.annotation.Auth;
import com.softlab.okr.annotation.TaskInfo;
import com.softlab.okr.entity.Resource;
import com.softlab.okr.entity.Task;
import com.softlab.okr.security.ApiFilter;
import com.softlab.okr.security.MySecurityMetadataSource;
import com.softlab.okr.service.IResourceService;
import com.softlab.okr.service.IRoleResourceService;
import com.softlab.okr.service.ITaskService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.type.classreading.CachingMetadataReaderFactory;
import org.springframework.core.type.classreading.MetadataReader;
import org.springframework.core.type.classreading.MetadataReaderFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author RudeCrab
 */
@Component
public class ApplicationStartup implements ApplicationRunner {

    @Autowired
    private RequestMappingInfoHandlerMapping requestMappingInfoHandlerMapping;

    @Autowired
    private IResourceService resourceService;

    @Autowired
    private IRoleResourceService roleResourceService;

    @Autowired
    private ITaskService taskService;


    private static final String jobPackage = "com.softlab.okr.job";

    private static final String resourceType = "/*.class";

    @Override
    public void run(ApplicationArguments args) throws Exception {
        loadResource();
        loadTask();
    }

    @Transactional
    void loadResource() {
        // 扫描并获取所有需要权限处理的接口资源(该方法逻辑写在下面)
        List<Resource> list = getAuthResources();
        // 如果权限资源为空，就不用走后续数据插入步骤
        if (Collections.isEmpty(list)) {
            return;
        }
        //清空数据库资源表，保存最新资源到数据库
        resourceService.remove(null);
        resourceService.saveBatch(list);
        // 筛选权限资源
        List<Resource> resourceList = resourceService.list();
        Set<Resource> set = resourceList.stream().filter(resource -> resource.getRole() != null).collect(Collectors.toSet());
        // 将权限资源给放到本地权限缓存里，用于请求时校验使用
        MySecurityMetadataSource.setResources(set);
        //添加所有资源进资源过滤器
        ApiFilter.getResources().addAll(resourceList);
        //将资源数据批量添加到数据库, 重载管理员和用户的资源
        roleResourceService.reloadRoleResource(list);
    }

    /**
     * 扫描并返回所有需要权限处理的接口资源
     */
    private List<Resource> getAuthResources() {
        // 接下来要添加到数据库的资源
        List<Resource> list = new LinkedList<>();
        // 拿到所有接口信息，并开始遍历
        Map<RequestMappingInfo, HandlerMethod> handlerMethods =
                requestMappingInfoHandlerMapping.getHandlerMethods();
        handlerMethods.forEach(
                (info, handlerMethod) -> {
                    // 拿到类(模块)上的权限注解
                    //Auth moduleAuth = handlerMethod.getBeanType().getAnnotation(Auth.class);
                    // 拿到接口方法上的权限注解
                    Auth methodAuth = handlerMethod.getMethod().getAnnotation(Auth.class);
                    // 模块注解和方法注解缺一个都代表不进行权限处理
                    if (methodAuth == null) {
                        return;
                    }
                    // 拿到该接口方法的请求方式(GET、POST等)
                    Set<RequestMethod> methods = info.getMethodsCondition().getMethods();
                    // 如果一个接口方法标记了多个请求方式，权限id是无法识别的，不进行处理
                    if (methods.size() != 1) {
                        return;
                    }
                    String method = methods.toArray()[0] + "";
                    String path = info.getPatternsCondition().getPatterns().toArray()[0] + "";
                    String role = methodAuth.role();
                    // 将权限名、资源路径、资源类型组装成资源对象，并添加集合中
                    Resource resource = new Resource();
                    resource
                            .setName(methodAuth.name())
                            .setMethod(method)
                            .setPath(path)
                            .setRole(role)
                            .setStatus(1);
                    list.add(resource);
                });
        return list;
    }

    /**
     * 加载所有的task任务
     */
    private void loadTask() {
        List<Task> taskList = getTasks();
        taskService.saveOrUpdateBatch(taskList);
    }

    /**
     * 扫描所有的自定义任务类,加载到一个List容器用来保存
     */
    private List<Task> getTasks() {
        List<Task> list = new LinkedList<>();
        //spring工具类，可以获取指定路径下的全部类
        ResourcePatternResolver resourcePatternResolver = new PathMatchingResourcePatternResolver();
        try {
            String pattern = ResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX +
                    ClassUtils.convertClassNameToResourcePath(jobPackage) + resourceType;
            org.springframework.core.io.Resource[] resources = resourcePatternResolver
                    .getResources(pattern);
            //MetadataReader 的工厂类
            MetadataReaderFactory readerFactory = new CachingMetadataReaderFactory(
                    resourcePatternResolver);
            for (org.springframework.core.io.Resource resource : resources) {
                //用于读取类信息
                MetadataReader reader = readerFactory.getMetadataReader(resource);
                //扫描到的class
                String classname = reader.getClassMetadata().getClassName();
                Class<?> clazz = Class.forName(classname);
                //判断是否有指定主解
                TaskInfo taskInfo = clazz.getAnnotation(TaskInfo.class);
                if (taskInfo != null) {
                    Task task = new Task(null, taskInfo.taskId(), taskInfo.name(), classname,
                            taskInfo.function());
                    list.add(task);
                }
            }
        } catch (IOException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace()[0]);
        }
        return list;
    }
}

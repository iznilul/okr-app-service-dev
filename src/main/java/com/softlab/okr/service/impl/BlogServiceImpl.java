package com.softlab.okr.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.constant.EntityNames;
import com.softlab.okr.entity.*;
import com.softlab.okr.mapper.BlogMapper;
import com.softlab.okr.model.dto.BlogDTO;
import com.softlab.okr.model.dto.BlogListDTO;
import com.softlab.okr.model.enums.BlogStatusEnum;
import com.softlab.okr.model.enums.OriginalIsOrNotEnum;
import com.softlab.okr.model.enums.PublishIsOrNotEnum;
import com.softlab.okr.model.exception.BusinessException;
import com.softlab.okr.model.vo.BlogListVO;
import com.softlab.okr.model.vo.BlogVO;
import com.softlab.okr.service.*;
import com.softlab.okr.utils.CopyUtil;
import com.softlab.okr.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2022-04-25
 */
@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements IBlogService {

    @Autowired
    private ICategoryService categoryService;

    @Autowired
    private IBlogTagService blogTagService;

    @Autowired
    private ITagService tagService;

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private IUserInfoService userInfoService;

    @Override
    @Transactional
    public void saveBlog(BlogDTO dto) {
        MultipartFile file = dto.getFile();
        try {
            byte[] data = file.getBytes();
            if (data.length > 10240000) {
                throw new BusinessException("文件太大,请上传10m以内的文件");
            }
        } catch (IOException e) {
            throw new BusinessException("文件流io错误");
        }
        String fileName = file.getOriginalFilename();
        if (null == fileName) {
            throw new BusinessException("文件名不合法");
        }
        if (!FileUtil.isMarkdown(fileName)) {
            throw new BusinessException("请上传md格式文件");
        }
        String content = null;
        try {
            content = FileUtil.markdownToHtml(file);
        } catch (IOException e) {
            log.error(e.toString());
            throw new BusinessException("md文件解析错误");
        }
        Category category = categoryService.getOne(new LambdaQueryWrapper<Category>().eq(Category::getName,
                dto.getCategoryName()));
        List<BlogTag> list = new ArrayList<>();
        Integer originIsOrNot = OriginalIsOrNotEnum.getCode(dto.getOriginalIsOrNot());
        Blog blog = new Blog();
        blog.setTitle(dto.getTitle());
        blog.setContent(content);
        blog.setClickCount(0);
        blog.setPublishIsOrNot(PublishIsOrNotEnum.NOT_PUBLISH.code());
        blog.setOriginalIsOrNot(originIsOrNot);
        blog.setOriginUrl(dto.getOriginUrl());
        blog.setUsername(dto.getUsername());
        blog.setCategoryId(category.getCategoryId());
        blog.setStatus(BlogStatusEnum.NOT_SCORED.code());
        blog.setDeleteFlag(0);
        this.save(blog);
        list = this.buildBlogTagList(blog.getBlogId(), dto.getTagList());
        blogTagService.saveBatch(list);
    }

    @Override
    @Cacheable(cacheNames = EntityNames.BLOG + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public BlogVO getBlog(String id) {
        Blog blog = this.getOne(new LambdaQueryWrapper<Blog>().eq(Blog::getBlogId, id));
        BlogVO vo = CopyUtil.copy(blog, BlogVO.class);
        List<BlogTag> blogTagList = blogTagService.list();
        vo.setTagList(this.buildTagList(blog.getBlogId(), blogTagList));
        return vo;
    }

    @Override
    @Cacheable(cacheNames = EntityNames.BLOG + "#10m", keyGenerator =
            com.softlab.okr.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<BlogListVO> getBlogList(BlogListDTO dto) {
        Page<Blog> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<Blog> blogPage = blogMapper.selectPage(page, null);
        Page<BlogListVO> voPage = new Page<>();
        List<BlogListVO> list = new ArrayList<>();
        List<BlogTag> blogTagList = blogTagService.list();
        List<UserInfo> userInfoList = userInfoService.list();
        blogPage.getRecords().forEach(blog -> {
            BlogListVO vo = new BlogListVO();
            vo = CopyUtil.copy(blog, BlogListVO.class);
            vo.setStatusName(BlogStatusEnum.getMessage(blog.getStatus()));
            vo.setTagList(this.buildTagList(blog.getBlogId(), blogTagList));
            vo.setName(this.getName(userInfoList, blog.getUsername()));
            list.add(vo);
        });
        voPage.setRecords(list);
        return voPage;
    }

    private String getName(List<UserInfo> userInfoList, String username) {
        for (UserInfo userInfo : userInfoList) {
            if (userInfo.getUsername().equals(username)) {
                return userInfo.getName();
            }
        }
        return null;
    }

    private List<String> buildTagList(Integer blogId, List<BlogTag> blogTagList) {
        List<Integer> tagIdList = blogTagList.stream().filter(blogTag -> blogTag.getBlogId().equals(blogId))
                .map(BlogTag::getBlogId).collect(Collectors.toList());
        List<Tag> tagList = tagService.listByIds(tagIdList);
        return tagList.stream().map(Tag::getName).collect(Collectors.toList());
    }

    private List<BlogTag> buildBlogTagList(Integer blogId, List<String> list) {
        List<Tag> tagList = tagService.list();
        List<BlogTag> blogTagList = new ArrayList<>();
        list.forEach(s -> {
            BlogTag blogTag = new BlogTag();
            Integer tagId = null;
            for (Tag tag : tagList) {
                if (tag.getName().equals(s)) {
                    tagId = tag.getTagId();
                }
            }
            if (tagId == null) {
                throw new BusinessException("标签错误");
            }
            blogTag.setBlogId(blogId);
            blogTag.setTagId(tagId);
            blogTagList.add(blogTag);
        });
        return blogTagList;
    }

}

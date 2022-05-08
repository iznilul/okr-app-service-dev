package com.itlab.blog.service.impl;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.constant.EntityNames;
import com.itlab.blog.constant.TimeFormat;
import com.itlab.blog.entity.RecruitGroup;
import com.itlab.blog.entity.SignUp;
import com.itlab.blog.mapper.SignUpMapper;
import com.itlab.blog.model.dto.SignUpAddDTO;
import com.itlab.blog.model.dto.SignUpChangeDTO;
import com.itlab.blog.model.dto.SignUpDTO;
import com.itlab.blog.model.enums.SignUpEnum;
import com.itlab.blog.model.exception.BusinessException;
import com.itlab.blog.model.vo.SignUpVO;
import com.itlab.blog.service.IRecruitGroupService;
import com.itlab.blog.service.ISignUpService;
import com.itlab.blog.utils.CopyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
public class SignUpServiceImpl extends ServiceImpl<SignUpMapper, SignUp> implements ISignUpService {

    @Autowired
    private SignUpMapper signUpMapper;

    @Autowired
    private IRecruitGroupService recruitGroupService;

    // 报名
    @Override
    @CacheEvict(cacheNames = EntityNames.SIGNUP, allEntries = true)
    public void saveSignUp(SignUpAddDTO dto) {
        QueryWrapper<SignUp> wrapper = new QueryWrapper<SignUp>().eq("student_id",
                dto.getStudentId());
        SignUp signUp = CopyUtil.copy(dto, SignUp.class);
        signUp.setStatus(0);
        if (null != signUpMapper.selectOne(wrapper)) {
            signUpMapper.update(signUp, wrapper);
        } else {
            signUpMapper.insert(signUp);
        }
    }

    //录取结果更新
    @Override
    @CacheEvict(cacheNames = EntityNames.SIGNUP, allEntries = true)
    public void modifySignUp(SignUpChangeDTO dto) {
        SignUp signUp = signUpMapper.selectOne(new QueryWrapper<SignUp>().eq("student_id",
                dto.getStudentId()));
        if (signUp == null) {
            throw new BusinessException("活动id错误");
        }
        signUp.setComment(dto.getComment());
        signUp.setStatus(SignUpEnum.getCode(dto.getStatusName()));
        signUpMapper.updateById(signUp);
    }

    //根据参数返回报名列表
    @Override
    @Cacheable(cacheNames = EntityNames.SIGNUP + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public Page<SignUpVO> getSignUpByList(SignUpDTO dto) {
        Page<SignUp> page = new Page<>(dto.getIndex(), dto.getPageSize());
        Page<SignUp> signUpPage = signUpMapper.selectPage(page, new QueryWrapper<SignUp>()
                .like((StringUtils.isNotBlank(dto.getStudentId())), "student_id",
                        dto.getStudentId())
                .like((StringUtils.isNotBlank(dto.getName())), "name", dto.getName())
                .like((StringUtils.isNotBlank(dto.getMajor())), "major", dto.getMajor())
                .orderByAsc("status"));
        Page<SignUpVO> voPage = new Page<>();
        List<SignUpVO> list = new ArrayList<>();
        signUpPage.getRecords().forEach(signUp -> {
            SignUpVO vo = CopyUtil.copy(signUp, SignUpVO.class);
            vo.setStatusName(SignUpEnum.getMessage(vo.getStatus()));
            list.add(vo);
        });
        voPage.setRecords(list);
        voPage.setCurrent(signUpPage.getCurrent());
        voPage.setTotal(signUpPage.getTotal());
        return voPage;
    }

    //根据id返回用户
    @Override
    @Cacheable(cacheNames = EntityNames.SIGNUP + "#10m", keyGenerator =
            com.itlab.blog.constant.EntityNames.MD5_KEY_GENERATOR,
            unless = "#result=null")
    public SignUpVO getSignUpById(String studentId) {
        SignUp signUp = signUpMapper
                .selectOne(new QueryWrapper<SignUp>().eq("student_id", studentId));
        if (signUp != null) {
            SignUpVO vo = CopyUtil.copy(signUp, SignUpVO.class);
            RecruitGroup recruitGroup = recruitGroupService.getOne(null);
            vo.setStatusName(SignUpEnum.getMessage(vo.getStatus()));
            vo.setOther(recruitGroup.getGroupNumber());
            vo.setUpdateTime(DateUtil.format(signUp.getUpdateTime(), TimeFormat.format));
            return vo;
        } else {
            return null;
        }
    }

    @Override
    public void exportSignUp(HttpServletResponse response) throws IOException {
        String name = "实验室报名表" + DateUtil.today();
        List<SignUp> list = signUpMapper.selectList(null);
        List<SignUpVO> voList = new ArrayList<>();
        list.forEach(signUp -> {
            SignUpVO vo = CopyUtil.copy(signUp, SignUpVO.class);
            vo.setStatusName(SignUpEnum.getMessage(signUp.getStatus()));
            voList.add(vo);
        });
        // 通过工具类创建writer，默认创建xls格式
        ExcelWriter writer = ExcelUtil.getWriter();
        writer.addHeaderAlias("studentId", "学号");
        writer.addHeaderAlias("name", "姓名");
        writer.addHeaderAlias("gender", "性别");
        writer.addHeaderAlias("qq", "qq号");
        writer.addHeaderAlias("major", "专业班级");
        writer.addHeaderAlias("profile", "个人简介");
        writer.addHeaderAlias("statusName", "状态");
        writer.addHeaderAlias("comment", "评语");
        // 一次性写出内容，使用默认样式，强制输出标题
        writer.write(voList, true);
        //out为OutputStream，需要写出到的目标流

        //response为HttpServletResponse对象
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(name,
                "utf-8") + ".xls");
        ServletOutputStream out = response.getOutputStream();

        writer.flush(out, true);
        // 关闭writer，释放内存
        writer.close();
        //此处记得关闭输出Servlet流
        IoUtil.close(out);
    }
}
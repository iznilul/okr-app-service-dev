package com.softlab.okr.service.impl;


import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.enums.statusCode.SignUpStatus;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.ISignUpService;
import com.softlab.okr.utils.Result;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
public class SignUpServiceImpl extends ServiceImpl<SignUpMapper, SignUp> implements ISignUpService {

  @Autowired
  private SignUpMapper signUpMapper;

  // 报名
  @Override
  public int saveSignUp(UserSignUpDTO dto) {
    QueryWrapper<SignUp> wrapper = new QueryWrapper<SignUp>().eq("student_id", dto.getStudentId());
    SignUp signUp = new SignUp();
    BeanUtils.copyProperties(dto, signUp);
    signUp.setStatus(0);
    if (null != signUpMapper.selectOne(wrapper)) {
      return signUpMapper.update(signUp, wrapper);
    } else {
      return signUpMapper.insert(signUp);
    }
  }

  //录取结果更新
  @Override
  public int modifySignUp(SignUp signUp) {
    return signUpMapper.updateById(signUp);
  }

  //根据参数返回报名列表
  @Override
  public Result getSignUpByCond(SignUpDTO dto) {
    dto.setStatus(dto.getStatueName() == null ? null : SignUpStatus.getCode(dto.getStatueName()));
    Page<SignUp> page = new Page<>(dto.getIndex(), dto.getPageSize());
    Page<SignUpVO> voPage = signUpMapper.selectSignUpByCond(page, dto);
    if (voPage.getSize() == 0) {
      page.setCurrent(1);
      voPage = signUpMapper.selectSignUpByCond(page, dto);
    }
    List<SignUpVO> list = voPage.getRecords();
    list.forEach(vo -> {
      vo.setStatusName(SignUpStatus.getMessage(vo.getStatus()));
    });
    return Result.success(list, voPage.getTotal());
  }

  //根据id返回用户
  @Override
  public SignUpVO getSignUpById(String studentId) {
    SignUp signUp = signUpMapper
        .selectOne(new QueryWrapper<SignUp>().eq("student_id", studentId));
    if (signUp != null) {
      SignUpVO vo = new SignUpVO();
      BeanUtils.copyProperties(signUp, vo);
      vo.setStatusName(SignUpStatus.getMessage(vo.getStatus()));
      return vo;
    } else {
      return null;
    }
  }

  @Override
  public void exportSignUp(HttpServletResponse response) throws IOException {
    List<SignUp> list = signUpMapper.selectList(null);
    List<SignUpVO> voList = new ArrayList<>();
    list.forEach(signUp -> {
      SignUpVO vo = new SignUpVO();
      BeanUtils.copyProperties(signUp, vo);
      vo.setStatusName(SignUpStatus.getMessage(signUp.getStatus()));
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
    writer.addHeaderAlias("status", "状态");
    writer.addHeaderAlias("comment", "评语");
    writer.addHeaderAlias("updateTime", "更新时间");
    // 一次性写出内容，使用默认样式，强制输出标题
    writer.write(voList, true);
    //out为OutputStream，需要写出到的目标流

    //response为HttpServletResponse对象
    response.setContentType("application/vnd.ms-excel;charset=utf-8");
    //test.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
    response.setHeader("Content-Disposition", "attachment;filename=signUp.xls");
    ServletOutputStream out = response.getOutputStream();

    writer.flush(out, true);
    // 关闭writer，释放内存
    writer.close();
    //此处记得关闭输出Servlet流
    IoUtil.close(out);
  }
}

package com.softlab.okr.service.impl;


import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.dto.UserSignUpDTO;
import com.softlab.okr.model.enums.statusCode.SignUpStatus;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.SignUpService;
import java.io.IOException;
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
public class SignUpServiceImpl implements SignUpService {

  @Autowired
  private SignUpMapper signUpMapper;

  // 报名
  @Override
  public int saveSignUp(UserSignUpDTO dto) {
    Integer id = this.getIsExist(dto.getStudentId());
    if (null != id) {
      SignUp signUp = new SignUp();
      BeanUtils.copyProperties(dto, signUp);
      signUp.setStatus(0);
      return signUpMapper.updateSignUp(signUp);
    }
    return signUpMapper.insertSignUp(dto);
  }

  // 检查是否已报名
  @Override
  public Integer getIsExist(String studentId) {
    return signUpMapper.selectIsExist(studentId);
  }


  //录取结果更新
  @Override
  public int modifySignUp(SignUp signUp) {
    return signUpMapper.updateSignUp(signUp);
  }

  //根据参数返回报名列表
  @Override
  public PageInfo<SignUpVO> getSignUpByCond(SignUpDTO signUpDTO) {
    PageHelper.startPage(signUpDTO.getIndex(), signUpDTO.getPageSize());
    List<SignUpVO> list = signUpMapper.selectSignUpByCond(signUpDTO);

    list.forEach(vo -> {
      vo.setStatusName(SignUpStatus.getMessage(vo.getStatus()));
    });
    return new PageInfo<>(list);
  }

  //根据id返回用户
  @Override
  public SignUpVO getSignUpById(String studentId) {
    SignUpVO signUpVO = signUpMapper.selectSignUpById(studentId);
    return signUpVO == null ? null
        : signUpVO.setStatusName(SignUpStatus.getMessage(signUpVO.getStatus()));
  }

  // 拉取所有
  @Override
  public List<SignUpVO> getSignUp() {
    return signUpMapper.selectSignUp();
  }

  @Override
  public void exportSignUp(HttpServletResponse response) throws IOException {
    List<SignUpVO> list = this.getSignUp();
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
    writer.write(list, true);
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

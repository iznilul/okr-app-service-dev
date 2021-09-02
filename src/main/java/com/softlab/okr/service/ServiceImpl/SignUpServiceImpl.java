package com.softlab.okr.service.ServiceImpl;


import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.convert.impl.SignUpConvert;
import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.SignUpService;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
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

  @Autowired
  SignUpConvert signUpConvert;

  private static final Map<Integer, String> map = new HashMap<>();

  static {
    map.put(0, "未审批，请耐心等待");
    map.put(1, "已录取");
    map.put(2, "未录取");
  }

  // 报名
  @Override
  public int saveSignUpList(SignUp signUp) {
    return signUpMapper.insertSignUpList(signUp);
  }

  // 检查是否已报名
  @Override
  public String getIsExist(String id) {
    return signUpMapper.selectIsExist(id);
  }


  //录取结果更新
  @Override
  public int modifySignUpList(SignUp signUp) {
    return signUpMapper.updateSignUpList(signUp);
  }

  //根据参数返回报名列表
  @Override
  public PageInfo<SignUpVO> getSignUpListByCond(SignUpDTO signUpDTO) {
    PageHelper.startPage(signUpDTO.getIndex(), signUpDTO.getPageSize());
    List<SignUpVO> list = new LinkedList<>();
    List<SignUp> signUps = signUpMapper.selectSignUpListByCond(signUpDTO);

    signUps.forEach(signUp -> {
      SignUpVO signUpVO = signUpConvert.convertVO(signUp)
          .setStatus(map.get(signUp.getStatus()));
      list.add(signUpVO);
    });
    return new PageInfo<>(list);
  }

  //根据id返回用户
  @Override
  public SignUpVO getSignUpListById(String id) {
    SignUp signUp = signUpMapper.selectSignUpListById(id);
    return signUp == null ? null
        : signUpConvert.convertVO(signUp).setStatus(map.get(signUp.getStatus()));
  }

  // 拉取所有
  @Override
  public List<SignUp> getSignUpList() {
    return signUpMapper.selectSignUpList();
  }

  @Override
  public void exportSignUpList(HttpServletResponse response) throws IOException {
    List<SignUp> list = this.getSignUpList();
    // 通过工具类创建writer，默认创建xls格式
    ExcelWriter writer = ExcelUtil.getWriter();
    writer.addHeaderAlias("id", "学号");
    writer.addHeaderAlias("name", "姓名");
    writer.addHeaderAlias("gender", "性别");
    writer.addHeaderAlias("qq", "qq号");
    writer.addHeaderAlias("major", "专业班级");
    writer.addHeaderAlias("profile", "个人简介");
    writer.addHeaderAlias("status", "状态");
    writer.addHeaderAlias("comment", "评语");
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

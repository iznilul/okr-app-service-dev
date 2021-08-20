package com.softlab.okr.service.ServiceImpl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.SignUpService;
import java.util.List;
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
  public int saveSignUpList(SignUp signUp) {
    return signUpMapper.insertSignUpList(signUp);
  }

  // 检查是否已报名
  @Override
  public String getIsExist(String id) {
    return signUpMapper.selectIsExist(id);
  }

  //查询录取结果
  @Override
  public SignUpVO getSignUpListStatus(String id) {
    return signUpMapper.selectSignUpListStatus(id);
  }

  //录取结果更新
  @Override
  public int modifySignUpList(SignUp signUp) {
    return signUpMapper.updateSignUpList(signUp);
  }

  //根据参数返回报名列表
  @Override
  public PageInfo<SignUp> getSignUpListByCond(SignUpDTO signUpDTO) {
    PageHelper.startPage(signUpDTO.getIndex(), signUpDTO.getPageSize());
    List<SignUp> list = signUpMapper.selectSignUpListByCond(signUpDTO);
    return new PageInfo<>(list);
  }

  //根据id返回用户
  @Override
  public SignUp getSignUpListById(String id) {
    return signUpMapper.selectSignUpListById(id);
  }

  // 拉取所有
  @Override
  public List<SignUp> getSignUpList() {
    return signUpMapper.selectSignUpList();
  }
}

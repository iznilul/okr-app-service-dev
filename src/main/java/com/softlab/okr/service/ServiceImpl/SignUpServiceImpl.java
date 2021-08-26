package com.softlab.okr.service.ServiceImpl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.softlab.okr.convert.ConvertService;
import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
import com.softlab.okr.service.SignUpService;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
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
  ConvertService convertService;

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
      SignUpVO signUpVO = ((SignUpVO) convertService.convertVO(signUp))
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
        : ((SignUpVO) convertService.convertVO(signUp)).setStatus(map.get(signUp.getStatus()));
  }

  // 拉取所有
  @Override
  public List<SignUp> getSignUpList() {
    return signUpMapper.selectSignUpList();
  }
}

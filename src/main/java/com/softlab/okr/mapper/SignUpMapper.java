package com.softlab.okr.mapper;

import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * @Author: Devhui
 * @Date: 2020/6/3 13:08
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */
@Repository
public interface SignUpMapper {

  // 报名
  int insertSignUpList(SignUp signUp) throws DataAccessException;

  // 检查是否已报名
  String selectIsExist(String id) throws DataAccessException;

  //录取结果更新
  int updateSignUpList(SignUp signUp) throws DataAccessException;

  //根据传入的参数返回用户
  List<SignUp> selectSignUpListByCond(SignUpDTO signUpDTO) throws DataAccessException;

  //根据id返回用户
  SignUp selectSignUpListById(String id) throws DataAccessException;

  // 拉取所有
  List<SignUp> selectSignUpList() throws DataAccessException;

}

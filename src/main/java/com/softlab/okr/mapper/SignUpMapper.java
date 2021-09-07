package com.softlab.okr.mapper;

import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.model.vo.SignUpVO;
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
  int insertSignUp(SignUp signUp) throws DataAccessException;

  // 检查是否已报名
  String selectIsExist(String id) throws DataAccessException;

  //录取结果更新
  int updateSignUp(SignUp signUp) throws DataAccessException;

  //根据传入的参数返回用户
  List<SignUpVO> selectSignUpByCond(SignUpDTO dto) throws DataAccessException;

  //根据id返回用户
  SignUpVO selectSignUpById(String studentId) throws DataAccessException;

  // 拉取所有
  List<SignUpVO> selectSignUp() throws DataAccessException;

}

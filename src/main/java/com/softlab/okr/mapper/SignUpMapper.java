package com.softlab.okr.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.SignUp;
import com.softlab.okr.model.dto.SignUpDTO;
import com.softlab.okr.model.vo.SignUpVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

/**
 * @Author: Devhui
 * @Date: 2020/6/3 13:08
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */
@Repository
public interface SignUpMapper extends BaseMapper<SignUp> {

  //根据传入的参数返回用户
  Page<SignUpVO> selectSignUpByCond(@Param("page") Page<SignUp> page, @Param("dto") SignUpDTO dto)
      throws DataAccessException;

}

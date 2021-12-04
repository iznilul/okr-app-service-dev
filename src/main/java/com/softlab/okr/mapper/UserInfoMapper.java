package com.softlab.okr.mapper;

/**
 * @Author: Devhui @Date: 2019-11-28 17:05 @Version 1.0
 */

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.softlab.okr.entity.UserInfo;
import com.softlab.okr.model.dto.SelectUserDTO;
import com.softlab.okr.model.vo.UserInfoVO;
import org.springframework.stereotype.Repository;

@Repository
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    UserInfo selectUserInfoByUsername(String username);

    UserInfoVO selectUserInfoVOByUsername(String username);

    Page<UserInfoVO> selectUserInfoVOList(Page<UserInfo> page, SelectUserDTO dto);
}

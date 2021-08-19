package com.softlab.okr.mapper;

import com.softlab.okr.model.entity.SignUp;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2020/6/3 13:08
 * @Email: devhui@ihui.ink
 * @Version: 1.0
 */
@Repository
public interface SignUpMapper {

    int queryOK(String mname);

    int switchMenu(String mname, int status);

    // 添加
    int addNews(SignUp signUp);

    // 检查是否存在
    String isExist(String uid);

    // 查询
    int query(String uid);

    // 拉取所有
    List<SignUp> fetchAllStudents();

}

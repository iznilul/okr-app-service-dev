package com.softlab.okr.service.ServiceImpl;


import com.softlab.okr.mapper.SignUpMapper;
import com.softlab.okr.model.entity.SignUp;
import com.softlab.okr.service.SignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: Devhui
 * @Date: 2019-12-02 19:16
 * @Version 1.0
 */
@Service
@Transactional
public class SignUpServiceImpl implements SignUpService {
    @Autowired
    private SignUpMapper userMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public int addNews(SignUp user) {
        return userMapper.addNews(user);
    }

    @Override
    public int query(String uid) {
        return userMapper.query(uid);
    }

    @Override
    public boolean isOk(String mname) {
        int i = menuMapper.queryOK(mname);
        if (i == 1) {
            return true;
        }
        return false;
    }

    @Override
    public String isExist(String uid) {
        return userMapper.isExist(uid);
    }

    @Override
    public String switchMenu(String menu) {
        int menuStatus = this.getMenuStatus(menu);
        if (menuStatus == 1) {
            int i = menuMapper.switchMenu(menu, 0);
            return i == 1 ? menu + ", 已关闭" : "err";
        } else {
            int i = menuMapper.switchMenu(menu, 1);
            return i == 1 ? menu + ", 已打开" : "err";
        }
    }

    @Override
    public int getMenuStatus(String menu) {
        return menuMapper.queryOK(menu);
    }

    @Override
    public List<SignUp> fetchAllStudents() {
        return userMapper.fetchAllStudents();
    }
}

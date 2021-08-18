package com.softlab.okr.service;

import com.softlab.okr.exception.ServiceException;

public interface RoleService {

    void saveUserRole(int userId, int roleId) throws ServiceException;

    int getRoleId(String name) throws ServiceException;
}

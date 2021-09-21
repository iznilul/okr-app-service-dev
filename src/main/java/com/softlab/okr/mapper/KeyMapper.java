package com.softlab.okr.mapper;

import com.softlab.okr.entity.Key;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface KeyMapper {

  int insertKey(String keyName) throws DataAccessException;

  int updateKey(int keyId, String keyName) throws DataAccessException;

  int insertUser(int keyId, int userId) throws DataAccessException;

  int deleteById(int keyId) throws DataAccessException;

  int deleteByUserId(int keyId, int userId) throws DataAccessException;

  List<Key> selectList() throws DataAccessException;
}

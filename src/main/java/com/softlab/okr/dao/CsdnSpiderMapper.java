package com.softlab.okr.dao;

import com.softlab.okr.model.entity.CsdnSpider;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public interface CsdnSpiderMapper {

  List<CsdnSpider> selectList() throws DataAccessException;

  int insertAll(List<CsdnSpider> list) throws DataAccessException;

  int deleteAll() throws DataAccessException;

}

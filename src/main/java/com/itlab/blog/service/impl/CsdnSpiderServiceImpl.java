package com.itlab.blog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itlab.blog.entity.CsdnSpider;
import com.itlab.blog.mapper.CsdnSpiderMapper;
import com.itlab.blog.service.ICsdnSpiderService;
import com.itlab.blog.utils.Result;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-22
 */
@Service
public class CsdnSpiderServiceImpl extends ServiceImpl<CsdnSpiderMapper, CsdnSpider> implements ICsdnSpiderService {

  @Autowired
  CsdnSpiderMapper csdnSpiderMapper;

  @Override
  public Result getAll(){
    List<CsdnSpider> list = csdnSpiderMapper.selectList(null);
    if(list.size()!=0){
      return Result.success(list);
    }else{
      return Result.failure();
    }
  }
}

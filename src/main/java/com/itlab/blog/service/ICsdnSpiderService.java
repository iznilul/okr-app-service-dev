package com.itlab.blog.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itlab.blog.entity.CsdnSpider;
import com.itlab.blog.utils.Result;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-22
 */
public interface ICsdnSpiderService extends IService<CsdnSpider> {

  Result getAll();
}

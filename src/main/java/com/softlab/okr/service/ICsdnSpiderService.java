package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.CsdnSpider;
import com.softlab.okr.utils.Result;

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

package com.itlab.blog.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import java.util.Date;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

/**
 * mp 字段自动填充配置
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

  @Override
  public void insertFill(MetaObject metaObject) {
    log.info("start insert fill ....");
    Date date = new Date();
    this.setFieldValByName("createTime", date, metaObject);
    this.setFieldValByName("updateTime", date, metaObject);
  }

  @Override
  public void updateFill(MetaObject metaObject) {
    log.info("start update fill ....");
    Date date = new Date();
    this.setFieldValByName("updateTime", date, metaObject);
  }
}

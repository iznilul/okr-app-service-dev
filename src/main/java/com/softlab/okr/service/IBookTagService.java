package com.softlab.okr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.softlab.okr.entity.BookTag;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-23
 */
public interface IBookTagService extends IService<BookTag> {

    void saveBookTag(int bookId, List<Integer> list);

    List<Integer> getTagIdList(int bookId);
}

package com.softlab.okr.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author Mybatis-plus自动生成
 * @since 2021-09-23
 */
@Data
public class BookTag {

  private static final long serialVersionUID = 1L;

  /**
<<<<<<< HEAD
   * 书id
   */
  private Long bookId;
=======
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Integer id;
  /**
   * 书id
   */
  private Integer bookId;
>>>>>>> mybatis plus重构

  /**
   * 标签id
   */
<<<<<<< HEAD
  private Long tagId;

  /**
   * 主键
   */
  @TableId(value = "id", type = IdType.AUTO)
  private Long id;
=======
  private Integer tagId;

>>>>>>> mybatis plus重构


}

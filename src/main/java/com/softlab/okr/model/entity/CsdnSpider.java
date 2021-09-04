package com.softlab.okr.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-04 13:17
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsdnSpider {

  private String articleTitle;
  private String viewCount;
  private String articleDetailUrl;
  //private String hotRankScore;
  //private String avatarUrl;
  //private String nickName;
  //private boolean loginUserIsFollow;
  //private String userName;
  //private String favorCount;
  //private String commentCount;
  //private String pcHotRankScore;
  //private List<String> picList;
  //private String hotComment;
}

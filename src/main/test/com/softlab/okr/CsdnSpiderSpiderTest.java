package com.softlab.okr;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.softlab.okr.entity.CsdnSpider;
import com.softlab.okr.utils.HttpClientUtil;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-04 11:02
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class CsdnSpiderSpiderTest {

  @Autowired
  HttpClientUtil httpClientUtil;

  @Test
  public void main() throws IOException, URISyntaxException {
    String url = "https://blog.csdn.net/phoenix/web/blog/hot-rank?page=0&pageSize=25";
    String json = httpClientUtil.doGetJson(url);
    List<CsdnSpider> csdnList = new ArrayList<>();
    JSONObject jsonObject = JSON.parseObject(json);
    JSONArray list = jsonObject.getJSONArray("data");
    int length = list.size();
    for (int i = 0; i < length; i++) {
      csdnList.add(list.getJSONObject(i).toJavaObject(CsdnSpider.class));
    }
  }

  private void parse(String html) throws IOException {
    // 解析HTML获取DOM对象
    List<Object> list = new ArrayList<>();
    Document doc = Jsoup.parse(html);
    Elements elements = doc.getAllElements();
    elements.forEach(element -> {
      System.out.println(element.toString());
    });
    //Elements elements = doc.select("[class=title]");
    //elements.forEach(element -> {
    //  System.out.println(element.toString());
    //});
  }
}

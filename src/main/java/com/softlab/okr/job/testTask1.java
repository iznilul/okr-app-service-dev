package com.softlab.okr.job;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.softlab.okr.annotation.TaskInfo;
import com.softlab.okr.entity.CsdnSpider;
import com.softlab.okr.utils.HttpClientUtil;
import java.util.ArrayList;
import java.util.List;
import lombok.SneakyThrows;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @program:
 * @description:
 * @author: lulinzi
 * @create: 2021-08-24 16:15
 **/
@TaskInfo(taskId = "T1", name = "csdn爬虫", function = "测试cdsn爬虫")
public class testTask1 implements Job {

  @Autowired
  private HttpClientUtil httpClientUtil;

  //@Autowired
  //private CsdnSpiderMapper csdnSpiderMapper;

  @SneakyThrows
  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    //csdnSpiderMapper.deleteAll();
    String url = "https://blog.csdn.net/phoenix/web/blog/hot-rank?page=0&pageSize=25";
    String json = httpClientUtil.doGetJson(url);
    List<CsdnSpider> csdnList = new ArrayList<>();
    JSONObject jsonObject = JSON.parseObject(json);
    JSONArray list = jsonObject.getJSONArray("data");
    int length = list.size();
    for (int i = 0; i < length; i++) {
      csdnList.add(list.getJSONObject(i).toJavaObject(CsdnSpider.class));
    }
    csdnList.forEach(record -> System.out.println(record.toString()));
    //csdnSpiderMapper.insertAll(csdnList);
  }
}

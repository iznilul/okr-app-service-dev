package com.softlab.okr.utils;

import java.io.IOException;
import java.net.URISyntaxException;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

/**
 * @Program: okr
 * @Description:
 * @Author: lulinzi
 * @Date: 2021-09-04 10:41
 **/
@Component
@Slf4j
public class HttpClientUtil {

  /**
   * 根据请求地址获取对应的HTML页面
   *
   * @param url
   * @return
   */
  public String doGetHtml(String url) {
    // 1.创建HttpClient
    CloseableHttpClient httpClient = HttpClients.custom().build();
    // 2.添加url，构建HttpGet对象
    HttpGet httpGet = new HttpGet(url);
    httpGet.addHeader("User-Agent",
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36");
    // Request配置（比如请求超时如何处理。连接数有限，不可能无节制等待）
    httpGet.setConfig(getRequestConfig());

    CloseableHttpResponse response = null;
    try {
      // 3.发送请求得到响应
      response = httpClient.execute(httpGet);
      // 4.解析
      if (response.getStatusLine().getStatusCode() == HttpStatus.OK.value()) {
        HttpEntity entity = response.getEntity();
        // 响应体不为空
        if (entity != null) {
          return EntityUtils.toString(entity, "utf-8");
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (response != null) {
        try {
          response.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
        // httpClient不用关闭，连接池会管理
      }
    }
    return "";
  }

  public String doGetJson(String url) throws URISyntaxException {
    // 1.创建HttpClient
    CloseableHttpClient httpClient = HttpClients.custom().build();
    // 2.添加url，构建HttpGet对象
    HttpGet httpGet = new HttpGet(url);

    CloseableHttpResponse response = null;
    try {
      // 3.发送请求得到响应
      response = httpClient.execute(httpGet);
      // 4.解析
      if (response.getStatusLine().getStatusCode() == 200) {
        HttpEntity entity = response.getEntity();
        // 响应体不为空
        if (entity != null) {
          return EntityUtils.toString(entity, "utf-8");
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (response != null) {
        try {
          response.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
        // httpClient不用关闭，连接池会管理
      }
    }
    return "";
  }

  /**
   * Request配置
   *
   * @return
   */
  private static RequestConfig getRequestConfig() {
    return RequestConfig
        .custom()
        .setConnectTimeout(1000) // 创建连接的最长时间，毫秒
        .setConnectionRequestTimeout(500) // 获取连接的最长时间，毫秒
        .setSocketTimeout(1000 * 10) // 数据传输的最长时间，毫秒
        .build();
  }

}

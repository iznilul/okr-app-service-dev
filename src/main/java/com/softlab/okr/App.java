package com.softlab.okr;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan(basePackages = {"com.softlab.okr.mapper"})
@EnableAsync
@EnableTransactionManagement
public class App {

  public static void main(String[] args) {
    SpringApplication.run(App.class, args);
  }
}

package com.softlab.okr;

import com.softlab.okr.mapper.BookMapper;
import com.softlab.okr.model.entity.Book;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 21:44
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class BookTest {

  @Autowired
  BookMapper bookMapper;

  @BeforeClass    //公开表态无返回值
  public static void beforeClass() throws Exception {
    //每次测试类执行前执行一次，主要用来初使化公共资源等
  }

  @AfterClass     //公开表态无返回值
  public static void afterClass() throws Exception {
    //每次测试类执行完成后执行一次，主要用来释放资源或清理工作
  }

  @Before
  public void setup() throws Exception {
    //每个测试案例执行前都会执行一次
  }

  @After
  public void teardown() throws Exception {
    //每个测试案例执行完成后都会执行一次
  }

  @Test
  public void resourceTest() {
    Book book = new Book(3, "a", "a", "a", 1, 1, 1);
    try {
      bookMapper.insertBook(book);
    } catch (DataAccessException e) {
      System.out.println(e.toString());
    }
  }

  @Test
  public void selectList() {
    List<Book> list = bookMapper.selectList();
    list.forEach(System.out::println);
  }

  @Test
  public void updateById() {
    Book book = new Book(3, "a", "c", "c", 3, 3, 3);
    bookMapper.updateById(book);
  }
}


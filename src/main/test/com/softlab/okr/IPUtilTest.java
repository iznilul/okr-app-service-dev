package com.softlab.okr;

import com.softlab.okr.utils.IPUtils;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.UnknownHostException;

/**
 * @program: okr
 * @description:
 * @author: radCircle
 * @create: 2021-07-10 21:44
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
public class IPUtilTest {

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
    public void getHost() throws UnknownHostException {
        System.out.println(IPUtils.getHostName());
        System.out.println(IPUtils.getHostIP());
    }
}


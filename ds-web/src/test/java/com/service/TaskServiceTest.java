package com.service;

import com.wang.service.TTaskService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wxl on 2016/5/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring-context.xml")
public class TaskServiceTest {
    @Resource
    private TTaskService tTaskService;

    @Test
    public void getStudentTask(){
        List result = tTaskService.getTaskByStudentId(2);
        System.out.println(result.size());
    }
}

package com.service;

import com.wang.service.CourseService;
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
public class CourseServiceTest {
    @Resource
    private CourseService courseService;
    @Test
    public void getTeacherCourse(){
        List result = courseService.getTeachingCourse();
        System.out.println(result.size());
    }
}
